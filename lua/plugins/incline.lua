local defaults = require("config.defaults")
return {
  "b0o/incline.nvim",
  dependencies = {
    "akinsho/git-conflict.nvim",
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
      local bufname = vim.api.nvim_buf_get_name(props.buf)
      local filename = vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
      if filename == "" then
        filename = "[No Name]"
      end
      local icon, color = require("nvim-web-devicons").get_icon_color(filename)

      local function get_git_diff()
        local icons = { removed = "-", changed = "~", added = "+" }
        local signs = vim.b[props.buf].gitsigns_status_dict
        local labels = {}
        if signs == nil then
          return labels
        end
        for name, icon in pairs(icons) do
          if tonumber(signs[name]) and signs[name] > 0 then
            table.insert(labels, { " " .. icon .. signs[name], group = "Diff" .. name })
          end
        end

        return labels
      end

      local function get_diagnostic_label()
        local icons = {
          error = defaults.icons.diagnostics.error,
          warn = defaults.icons.diagnostics.warn,
          info = defaults.icons.diagnostics.info,
          hint = defaults.icons.diagnostics.hint,
        }
        local label = {}

        for severity, icon in pairs(icons) do
          local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
          if n > 0 then
            table.insert(label, { " " .. icon .. n, group = "DiagnosticSign" .. severity })
          end
        end

        return label
      end

      local function conflict_count()
        local count = require("git-conflict").conflict_count(props.buf)
        return { count > 0 and "  " .. count or "", group = "Error" }
      end

      return {
        { icon, guifg = color },
        { " " },
        {
          filename,
          gui = vim.bo[props.buf].modified and "italic" or "",
          guifg = vim.bo[props.buf].modified and "#9ece6a" or "#7aa2f7",
        },
        { get_git_diff() },
        { conflict_count() },
        { get_diagnostic_label() },
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
