return {
  "b0o/incline.nvim",
  enabled = true,
  config = function()
    require("incline").setup({
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
        if vim.api.nvim_get_option_value("readonly", { buf = props.buf }) then
          filename = filename .. " [-]"
        end
        if vim.api.nvim_get_option_value("modified", { buf = props.buf }) then
          filename = filename .. " [+]"
        end
        return {
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
      ignore = {
        filetypes = { "oil" },
      },
    })
  end,
  event = "VeryLazy",
}
