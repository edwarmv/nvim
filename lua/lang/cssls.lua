local maps = require("maps")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic = require("config.nvim-navic")

require("lspconfig").cssls.setup({
  capabilities = capabilities,
  -- cmd = { "css-languageserver", "--stdio" },
  -- cmd = { "vscode-css-language-server", "--stdio" },
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
    navic.attach(client, bufnr)
  end,
})
