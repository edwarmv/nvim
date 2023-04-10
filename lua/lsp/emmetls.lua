local util = require("lspconfig.util")
require("lspconfig").emmet_ls.setup({
  filetypes = { "html", "css", "scss" },
  root_dir = function(fname)
    return util.root_pattern("package.json", ".git")(fname) or util.path.dirname(fname)
  end,
})

-- local lspconfig = require'lspconfig'
-- local configs = require'lspconfig/configs'

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- if not lspconfig.emmet_ls then
--   configs.emmet_ls = {
--     default_config = {
--       cmd = {'emmet-ls', '--stdio'};
--       filetypes = {'html', 'css'};
--       root_dir = function(fname)
--         return vim.loop.cwd()
--       end;
--       settings = {};
--     };
--   }
-- end
-- lspconfig.emmet_ls.setup{ capabilities = capabilities; }
