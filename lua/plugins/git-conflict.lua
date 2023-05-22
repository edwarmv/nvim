return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = function()
    require("git-conflict").setup({
      default_mappings = false, -- disable buffer local mapping created by this plugin
      disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = { -- They must have background color, otherwise the default color will be used
        current = "DiffAdd",
        incoming = "DiffChange",
        ancestor = "Visual",
      },
    })
    vim.keymap.set("n", "<leader>gco", "<Plug>(git-conflict-ours)", { desc = "Git Conflict - Choose Ours" })
    vim.keymap.set("n", "<leader>gct", "<Plug>(git-conflict-theirs)", { desc = "Git Conflict - Choose Theirs" })
    vim.keymap.set("n", "<leader>gcb", "<Plug>(git-conflict-both)", { desc = "Git Conflict - Choose Both" })
    vim.keymap.set("n", "<leader>gc0", "<Plug>(git-conflict-none)", { desc = "Git Conflict - Choose None" })
    vim.keymap.set("n", "]x", "<Plug>(git-conflict-prev-conflict)", { desc = "Git Conflict - Prev" })
    vim.keymap.set("n", "[x", "<Plug>(git-conflict-next-conflict)", { desc = "Git Conflict - Next" })
  end,
}
