local navic_attach = require("plugins.nvim-navic.attach")
local maps = require("config.maps")
require("lspconfig").pyright.setup({
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
    navic_attach.attach(client, bufnr)
  end,
})
