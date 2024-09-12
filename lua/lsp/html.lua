-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--     properties = {'documentation', 'detail', 'additionalTextEdits'}
-- }
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").html.setup({
  -- cmd = { "html-languageserver", "--stdio" },
  -- cmd = { "/Users/edwar/github/vscode/extensions/html-language-features/server/html-languageserver", "--stdio" },
  -- cmd = { "vscode-html-language-server", "--stdio" },
  -- cmd = { "/Users/edwar/github/vscode/extensions/html-language-features/server/vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ", "htmlangular" },
  capabilities = capabilities,
})
