return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons",
  },
  init = function()
    vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
      callback = function()
        require("incline").refresh()
      end,
    })
  end,
  opts = function()
    local helpers = require("incline.helpers")
    local devicons = require("nvim-web-devicons")
    local utils = require("config.utils")

    return {
      hide = {
        cursorline = "focused_win",
        focused_win = false,
        only_win = false,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        -- local ft_icon, ft_color = MiniIcons.get("file", filename)
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified

        if props.focused then
          local has_erros = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }) > 0

          return {
            ft_icon and { ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            {
              filename,
              gui = modified and "italic" or "",
              guifg = has_erros and utils.get_hl("Error").fg
                or vim.bo[props.buf].modified and vim.g.terminal_color_2
                or "",
            },
            " ",
            group = "StatusLine",
          }
        end

        return {
          ft_icon and { ft_icon, " ", gui = "inverse" } or "",
          " ",
          { filename, gui = modified and "italic" or "" },
          " ",
          group = "StatusLineNC",
        }
      end,
      window = {
        padding = 0,
        margin = {
          horizontal = 0,
        },
      },
      ignore = {
        filetypes = { "oil" },
      },
    }
  end,
}
