local defaults = require("config.defaults")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = defaults.border,
})
