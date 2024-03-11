local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").tailwindcss.setup({
  capabilities = capabilities,
  settings = {
    tailwindCSS = {
      suggestions = true,
    },
  },
  on_attach = function(client)
    client.server_capabilities.completionProvider.triggerCharacters = { '"', "'", "`", ".", "(", "[", "!", "/", ":" }
  end,
})
