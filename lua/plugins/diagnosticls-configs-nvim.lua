return {
  "creativenull/diagnosticls-configs-nvim",
  enabled = false,
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local dlsconfig = require("diagnosticls-configs")

    dlsconfig.init({
      -- Your custom attach function
      on_attach = function(client) end,
    })
    local prettier = require 'diagnosticls-configs.formatters.prettier'
    local stylua = require 'diagnosticls-configs.formatters.stylua'
    dlsconfig.setup({
      ['javascript'] = {
        formatter = prettier
      },
      ['javascriptreact'] = {
        formatter = { prettier }
      },
      ['typescript'] = {
        formatter = { prettier }
      },
      ['css'] = {
        formatter = { prettier }
      },
      ['html'] = {
        formatter = { prettier }
      },
      ['scss'] = {
        formatter = { prettier }
      },
      ['sass'] = {
        formatter = { prettier }
      },
      ['lua'] = {
        formatter = { stylua }
      },
    })
  end,
}
