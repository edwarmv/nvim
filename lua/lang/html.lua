local maps = require("maps")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic = require("config.nvim-navic")
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--     properties = {'documentation', 'detail', 'additionalTextEdits'}
-- }

require("lspconfig").html.setup({
  capabilities = capabilities,
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
    autoClosingTags = true,
  },
  settings = {
    autoClosingTags = true,
  },
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
    navic.attach(client, bufnr)
  end,
})
