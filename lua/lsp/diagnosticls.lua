-- https://github.com/sbdchd/neoformat
local util = require("lang/util")
require("lspconfig").diagnosticls.setup({
  -- root_dir = util.root_pattern(".git"),
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "html",
    "scss",
    "css",
    "json",
    "lua",
  },
  init_options = {
    --{{{
    -- linters = {
    --   tslint = {
    --     command = './node_modules/.bin/tslint',
    --     rootPatterns = { 'tslint.json' },
    --     debounce = 100,
    --     args = {
    --       '-t',
    --       'json',
    --       '%file',
    --     },
    --     offsetLine = 1,
    --     offsetColumn = 1,
    --     sourceName = 'tslint',
    --     parseJson = {
    --       line = 'startPosition.line',
    --       column = 'startPositon.character',
    --       endLine = 'endPosition.line',
    --       endColumn = 'endPositon.character',
    --       message = '${failure} (${ruleName})-[tslint]',
    --     }
    --   },
    --   eslint = {
    --     command = './node_modules/.bin/eslint',
    --     rootPatterns = { '.git' },
    --     debounce = 100,
    --     args = {
    --       '--stdin',
    --       '--stdin-filename',
    --       '%filepath',
    --       '--format',
    --       'json'
    --     },
    --     sourceName = 'eslint',
    --     parseJson = {
    --       errorsRoot = '[0].messages',
    --       line = 'line',
    --       column = 'column',
    --       endLine = 'endLine',
    --       endColumn = 'endColumn',
    --       message = '${message} eslint(${ruleId})',
    --       security = 'severity'
    --     },
    --     securities = {
    --       [2] = 'error',
    --       [1] = 'warning'
    --     }
    --   }
    -- },
    --}}}
    -- filetypes = {
    --   typescript = 'tslint',
    -- }
    formatters = {
      prettier = {
        command = "./node_modules/.bin/prettier",
        args = { "--stdin-filepath", "%filepath" },
      },
      stylua = {
        command = "stylua",
        args = { "--search-parent-directories", "--stdin-filepath", "%filepath", "--", "-" },
      },
    },
    formatFiletypes = {
      javascript = "prettier",
      javascriptreact = "prettier",
      javascriptjsx = "prettier",
      typescript = "prettier",
      typescriptreact = "prettier",
      typescripttsx = "prettier",
      html = "prettier",
      scss = "prettier",
      css = "prettier",
      json = "prettier",
      lua = "stylua",
    },
  },
})
