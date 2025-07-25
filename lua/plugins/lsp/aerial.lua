return {
  "stevearc/aerial.nvim",
  opts = {
    backends = { "lsp", "treesitter", "markdown", "man" },
    attach_mode = "global",
    on_attach = function(bufnr)
      vim.keymap.set("n", "<leader><leader>s", "<cmd>AerialToggle<CR><cmd>wincmd =<cr>", { buffer = bufnr })
    end,
    show_guides = true,
    float = {
      border = vim.o.winborder,
    },
    filter_kind = false,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
