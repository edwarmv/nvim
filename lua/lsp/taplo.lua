local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").taplo.setup({
  capabilities = capabilities,
})
