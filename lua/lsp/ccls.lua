local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").ccls.setup({
  single_file_support = true,
  capabilities = capabilities,
})
