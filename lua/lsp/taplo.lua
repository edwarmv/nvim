local maps = require("config.maps")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").taplo.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
  end,
})
