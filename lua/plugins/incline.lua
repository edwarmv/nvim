local defaults = require("config.defaults")

local function get_filename(props)
  local bufname = vim.api.nvim_buf_get_name(props.buf)
  local filename = vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
  if filename == "" then
    filename = "[No Name]"
  end
  local icon, hl = MiniIcons.get("file", filename)

  return {
    { icon, group = hl },
    { " " },
    {
      filename,
      gui = vim.bo[props.buf].modified and "italic" or "",
      guifg = vim.bo[props.buf].modified and "#9ece6a" or "#7aa2f7",
    },
  }
end

local diff_icons = { removed = "-", changed = "~", added = "+" }

local function get_git_diff(props)
  local signs = vim.b[props.buf].gitsigns_status_dict
  local labels = {}
  if signs == nil then
    return labels
  end
  for name, icon in pairs(diff_icons) do
    if tonumber(signs[name]) and signs[name] > 0 then
      table.insert(labels, {
        icon .. signs[name] .. " ",
        guifg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "diff" .. name }).fg),
      })
    end
  end

  return labels
end

local diagnostic_icons = {
  error = defaults.icons.diagnostics.error,
  warn = defaults.icons.diagnostics.warn,
  info = defaults.icons.diagnostics.info,
  hint = defaults.icons.diagnostics.hint,
}

local function get_diagnostic_label(props)
  if vim.fn.mode() == "i" then
    return {}
  end

  local label = {}

  for severity, icon in pairs(diagnostic_icons) do
    local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    if n > 0 then
      table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
    end
  end

  return label
end

local function conflict_count(props)
  local count = require("git-conflict").conflict_count(props.buf)
  return { count > 0 and " " .. count .. " " or "", group = "Error" }
end

return {
  "b0o/incline.nvim",
  dependencies = {
    -- "akinsho/git-conflict.nvim",
  },
  enabled = true,
  init = function()
    vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
      callback = function()
        require("incline").refresh()
      end,
    })
  end,
  opts = {
    hide = {
      cursorline = "focused_win",
      focused_win = false,
      only_win = false,
    },
    render = function(props)
      return {
        get_diagnostic_label(props),
        get_git_diff(props),
        conflict_count(props),
        get_filename(props),
      }
    end,
    window = {
      margin = {
        horizontal = 0,
      },
      zindex = 1,
    },
    ignore = {
      filetypes = { "oil" },
    },
  },
  event = "VeryLazy",
}
