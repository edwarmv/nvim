local navic = require("config.nvim-navic")
local maps = require("maps")
require("lspconfig").pyright.setup({
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
    navic.attach(client, bufnr)
  end,
})
