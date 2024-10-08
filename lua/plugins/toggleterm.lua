return {
  "akinsho/toggleterm.nvim",
  config = function()
    local defaults = require("config.defaults")
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      size = function(term)
        if term.direction == "horizontal" then
          return math.floor((vim.o.lines - vim.o.cmdheight) / 3)
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns / 3)
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
    vim.api.nvim_create_user_command("VTerm", function(opts)
      vim.fn.execute(opts.count .. "ToggleTerm direction=vertical")
    end, { count = true })
    vim.api.nvim_create_user_command("STerm", function(opts)
      vim.fn.execute(opts.count .. "ToggleTerm direction=horizontal")
    end, { count = true })
    vim.api.nvim_create_user_command("TTerm", "ToggleTerm direction=tab", {})
  end,
}
