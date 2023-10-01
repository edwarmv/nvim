return {
  "creativenull/efmls-configs-nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  enable = false,
  config = function()
    local prettier = require("efmls-configs.formatters.prettier")
    local stylua = require("efmls-configs.formatters.stylua")
    local black = require("efmls-configs.formatters.black")

    local languages = {
      json = { prettier },
      jsonc = { prettier },
      html = { prettier },
      css = { prettier },
      scss = { prettier },
      javascript = { prettier },
      typescript = { prettier },
      lua = { stylua },
      python = { black },
    }

    local efmls_config = {
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { ".git/" },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
    }

    require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
      -- Pass your custom lsp config below like on_attach and capabilities
      --
      -- on_attach = on_attach,
      -- capabilities = capabilities,
    }))
  end,
}
