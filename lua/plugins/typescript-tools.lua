local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  "pmizio/typescript-tools.nvim",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    capabilities = capabilities,
  },
}
