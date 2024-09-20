return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim", "ibhagwan/fzf-lua" },
  opts = {},
  keys = {
    { "<space>ft", "<cmd>TodoFzfLua<cr>" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>" },
  },
}
