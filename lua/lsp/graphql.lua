local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").graphql.setup({
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})
