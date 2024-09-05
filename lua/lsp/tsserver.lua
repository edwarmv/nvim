local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").ts_ls.setup({
  capabilities = capabilities,
  -- filetypes = {
  --   "javascript",
  --   "javascriptreact",
  --   "javascript.jsx",
  --   "typescript",
  --   "typescriptreact",
  --   "typescript.tsx",
  -- },
  init_options = {
    hostInfo = "neovim",
    -- preferences = {
    --   quotePreference = "auto", -- auto double single
    --   jsxAttributeCompletionStyle = "none",
    -- },
  },
  -- settings = {
  --   completions = { completeFunctionCalls = false },
  -- },
})
