local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").css_variables.setup({
  capabilities = capabilities,
})
