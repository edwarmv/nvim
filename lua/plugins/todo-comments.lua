return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
  config = function()
    require("todo-comments").setup({
      signs = false,
    })

    vim.keymap.set("n", "<space>tt", "<cmd>TodoTelescope<cr>")
    vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<cr>")
  end,
}
