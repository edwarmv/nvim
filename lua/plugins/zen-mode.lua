return {
  "folke/zen-mode.nvim",
  dependencies = {
    {
      "folke/twilight.nvim",
      opts = true,
      enabled = false,
    },
  },
  enabled = false,
  opts = {
    window = {
      width = 0.9,
    },
    on_open = function(_win)
      -- vim.opt_local.winbar = [[%{%v:lua.dropbar.get_dropbar_str()%}]]
    end,
  },
  keys = {
    { "<leader>Z", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
  },
}
