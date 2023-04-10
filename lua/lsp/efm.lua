local util = require 'lspconfig/util'
local prettier = {
  formatCommand = './node_modules/.bin/prettier "${INPUT}"',
  formatStdin = true,
  -- env = {
  --   string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/lua/utils/linter-config/.prettierrc.json')),
  -- },
}

require('lspconfig')['efm'].setup{
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {'.git', 'package.json'},
    languages = {
      lua = {
        {
          formatCommand = "stylua --search-parent-directories --stdin-filepath '${INPUT}' -- -",
          formatStdin = true,
        }
      },
      typescript = { prettier },
      scss = { prettier }
    }
  },
  filetypes = { 'typescript', 'lua', 'scss' }
}
