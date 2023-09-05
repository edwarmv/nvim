require("lspconfig").pyright.setup({
  settings = {
      python = {
        analysis = {
          diagnosticMode = 'openFilesOnly',
        },
      },
    },
})
