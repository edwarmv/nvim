local defaults = require("config.defaults")

return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return math.floor((vim.o.lines - vim.o.cmdheight) / 3)
      elseif term.direction == "vertical" then
        return math.floor(vim.o.columns / 3)
      end
    end,
    open_mapping = [[<c-`>]],
    direction = "float", -- 'vertical' | 'horizontal' | 'window' | 'float',
    shade_terminals = false,
    float_opts = {
      border = defaults.border,
      width = function(_term)
        local width = math.floor(vim.o.columns * 0.75)
        return width
      end,
      height = function(_term)
        local height = math.floor(vim.o.lines * 0.7)
        return height
      end,
    },
  },
  keys = {
    {
      "<leader>tf",
      function()
        local count = vim.v.count1
        vim.fn.execute(count .. "ToggleTerm direction=float")
      end,
      desc = "ToggleTerm - Float",
    },
    {
      "<leader>tv",
      function()
        local count = vim.v.count1
        vim.fn.execute(count .. "ToggleTerm direction=vertical")
      end,
      desc = "ToggleTerm - Vertical",
    },
    {
      "<leader>ts",
      function()
        local count = vim.v.count1
        vim.fn.execute(count .. "ToggleTerm direction=horizontal")
      end,
      desc = "ToggleTerm - Horizontal",
    },
    {
      "<leader>tt",
      function()
        local count = vim.v.count1
        vim.fn.execute(count .. "ToggleTerm direction=tab")
      end,
      desc = "ToggleTerm - Tab",
    },
  },
}
