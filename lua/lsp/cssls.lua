local maps = require("config.maps")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic_attach = require("plugins.nvim-navic.attach")

require("lspconfig").cssls.setup({
  capabilities = capabilities,
  -- cmd = { "css-languageserver", "--stdio" },
  -- cmd = { "vscode-css-language-server", "--stdio" },
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
    navic_attach.attach(client, bufnr)
  end,
})
