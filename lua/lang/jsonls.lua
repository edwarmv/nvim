local maps = require("maps")
-- JSON & YAML schemas http://schemastore.org/json/
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "<leader>f", '<Cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})<CR>', opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").jsonls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    maps.lsp(bufnr)
  end,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
      -- schemas = {
      --   {
      --     fileMatch = { 'package.json' },
      --     url = 'https://json.schemastore.org/package.json'
      --   },
      --   {
      --     fileMatch = { 'tsconfig.json', 'tsconfig.spec.json', 'tsconfig.app.json' },
      --     url = 'https://json.schemastore.org/tsconfig.json'
      --   },
      --   {
      --     fileMatch = { 'jsconfig.json' },
      --     url = 'https://json.schemastore.org/jsconfig.json'
      --   },
      --   {
      --     fileMatch = { 'tslint.json' },
      --     url = 'https://json.schemastore.org/tslint.json'
      --   },
      --   {
      --     fileMatch = { '.prettierrc.json' },
      --     url = 'https://json.schemastore.org/prettierrc.json'
      --   },
      -- }
    },
  },
})
