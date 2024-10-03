return {
  "akinsho/toggleterm.nvim",
  config = function()
    local defaults = require("config.defaults")
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return (1 / 3) * (vim.o.lines - vim.o.cmdheight)
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.5
        end
      end,
      open_mapping = [[<m-\>]],
      highlights = {
        NormalFloat = {
          link = "NormalFloat",
        },
        FloatBorder = {
          link = "FloatBorder",
        },
      },
      direction = "float", -- 'vertical' | 'horizontal' | 'window' | 'float',
      shade_terminals = false,
      float_opts = {
        border = defaults.border,
        width = function(_term)
          local width = math.floor(vim.o.columns * 0.9)
          return width
        end,
        height = function(_term)
          local height = math.floor(vim.o.lines * 0.8)
          return height
        end,
      },
    })

    vim.api.nvim_create_user_command("FTerm", "ToggleTerm direction=float", {})
    vim.api.nvim_create_user_command("VTerm", "ToggleTerm direction=vertical", {})
    vim.api.nvim_create_user_command("STerm", "ToggleTerm direction=horizontal", {})
    vim.api.nvim_create_user_command("TTerm", "ToggleTerm direction=tab", {})
  end,
}
