local defaults = require("config.defaults")

return {
  "folke/zen-mode.nvim",
  dependencies = {
    {
      "folke/twilight.nvim",
      opts = true,
      enabled = false,
    },
  },
  enabled = true,
  opts = {
    border = "none",
    window = {
      width = 0.9,
    },
    plugins = {
      options = {
        laststatus = 0,
      },
    },
    on_open = function(_win)
      -- vim.opt_local.winbar = [[%{%v:lua.dropbar.get_dropbar_str()%}]]
      vim.api.nvim_win_set_option(_win, "winbar", "")
    end,
  },
  keys = {
    { "<cr>", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  },
}
