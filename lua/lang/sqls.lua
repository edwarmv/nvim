local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").sqls.setup({
  autostart = true,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require("sqls").on_attach(client, bufnr)
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = "sqlite3",
          dataSourceName = "file:" .. vim.fn.expand("~/Documents/taller_iii/db/scibs.db"),
        },
        -- {
        --   driver = "mysql",
        --   dataSourceName = "root:root@tcp(127.0.0.1:13306)/world",
        -- },
        -- {
        --   driver = "postgresql",
        --   dataSourceName = "postgres://edwar@localhost/estrella",
        -- },
      },
    },
  },
})
