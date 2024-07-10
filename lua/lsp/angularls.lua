local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig.util")
-- local project_library_path = "/Users/edwarmv/.asdf/installs/nodejs/lts/lib/node_modules"
local project_library_path = vim.fn.expand("~") .. "/.local/share/nvim/mason/packages"

local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  vim.fn.expand("~") .. "/.local/share/nvim/mason/packages/angular-language-server/node_modules/@typescript/bin",
  "--ngProbeLocations",
  vim.fn.expand("~")
    .. "/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/bin",
}

require("lspconfig").angularls.setup({
  cmd = cmd,
  on_new_config = function(new_config, _)
    new_config.cmd = cmd
  end,
  filetypes = { "typescript", "html", "htmlangular", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities,
  on_attach = function(client, buffer)
    client.server_capabilities.renameProvider = true
  end,
})
