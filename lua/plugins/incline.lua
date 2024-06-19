local function filename_and_parent(path, sep)
  local segments = vim.split(path, sep)
  if #segments == 0 then
    return path
  elseif #segments == 1 then
    return segments[#segments]
  else
    return table.concat({ segments[#segments - 1], segments[#segments] }, sep)
  end
end

return {
  "b0o/incline.nvim",
  enabled = false,
  config = function()
    require("incline").setup({
      hide = {
        cursorline = "focused_win",
        focused_win = false,
        only_win = false,
      },
      render = function(props)
        local bufname = vim.api.nvim_buf_get_name(props.buf)
        local filename = bufname ~= "" and filename_and_parent(vim.fn.fnamemodify(bufname, "%:p:~"), "/") or "[No Name]"
        -- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        if vim.api.nvim_get_option_value("readonly", { buf = props.buf }) then
          filename = filename .. " [-]"
        end
        if vim.api.nvim_get_option_value("modified", { buf = props.buf }) then
          filename = filename .. " [+]"
        end

        local function get_diagnostic_label()
          local icons = { error = " ", warn = " ", info = " ", hint = " " }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.count(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
            end
          end
          -- if #label > 0 then
          --   table.insert(label, { "┊ " })
          -- end
          return label
        end
        return {
          -- { get_diagnostic_label() },
          { icon, guifg = color },
          { " " },
          { filename },
        }
      end,
      window = {
        margin = {
          horizontal = 0,
        },
        zindex = 1,
      },
    })
  end,
}
