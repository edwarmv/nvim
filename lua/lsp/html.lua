-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--     properties = {'documentation', 'detail', 'additionalTextEdits'}
-- }
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").html.setup({
  -- cmd = { "html-languageserver", "--stdio" },
  -- cmd = { "/Users/edwar/github/vscode/extensions/html-language-features/server/html-languageserver", "--stdio" },
  -- cmd = { "vscode-html-language-server", "--stdio" },
  -- cmd = { "/Users/edwar/github/vscode/extensions/html-language-features/server/vscode-html-language-server", "--stdio" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    filetypes = { "html", "templ", "htmlangular" },
    autoClosingTags = true,
  },
  settings = {
    autoClosingTags = true,
  },
  capabilities = capabilities,
})
