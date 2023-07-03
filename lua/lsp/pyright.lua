local maps = require("config.maps")
require("lspconfig").pyright.setup({
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
  end,
})
