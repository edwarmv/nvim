local defaults = require("config.defaults")

return {
  "rcarriga/nvim-notify",
  enabled = false,
  opts = {
    stages = "static",
    render = "minimal",
    on_open = function(win)
      local config = vim.api.nvim_win_get_config(win)
      config.border = defaults.border
      vim.api.nvim_win_set_config(win, config)
    end,
    timeout = 3000,
    minimum_width = 1,
    max_width = function()
      return math.floor(vim.opt.columns:get() / 3)
    end,
    max_height = 1,
    top_down = false,
  },
  config = function(_, opts)
    require("notify").setup(opts)

    vim.notify = require("notify")
  end,
}
