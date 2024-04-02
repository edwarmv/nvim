local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- require("lspconfig").pyright.setup({
--   settings = {
--     python = {
--       analysis = {
--         diagnosticMode = "openFilesOnly",
--       },
--     },
--   },
--   capabilities = capabilities,
-- })

require("lspconfig").basedpyright.setup({
  capabilities = capabilities,
})
