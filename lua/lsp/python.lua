local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- require("lspconfig").pyright.setup({
--   capabilities = capabilities,
-- })

require("lspconfig").basedpyright.setup({
  capabilities = capabilities,
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "standard", -- ["off", "basic", "standard", "strict", "all"]
        -- diagnosticSeverityOverrides = {
        --   reportMissingTypeStubs = "warning",
        --   reportUnknownMemberType = "warning",
        -- },
      },
    },
  },
})
