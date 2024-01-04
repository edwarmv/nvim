return {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup({
      signs = false,
    })

    vim.keymap.set("n", "<space>tt", "<cmd>TodoTelescope<cr>")
  end,
}
