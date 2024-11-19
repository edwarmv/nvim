local defaults = require("config.defaults")

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded", -- You can use "rounded", "single", "double", "solid", or a custom border style
})
