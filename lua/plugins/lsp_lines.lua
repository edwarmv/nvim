return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  depencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("lsp_lines").setup()
  end,
}
