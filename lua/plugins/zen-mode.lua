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
    window = {
      width = 0.9,
    },
    on_open = function(_win)
      vim.opt_local.winbar = [[%{%v:lua.dropbar.get_dropbar_str()%}]]
    end,
  },
  keys = {
    { "<cr>", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  },
}
