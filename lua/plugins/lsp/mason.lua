local defaults = require("config.defaults")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local filter_fold_servers = {
  "yamlls",
}

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "RubixDev/mason-update-all",
    },
    opts = {
      ui = {
        -- icons = {
        --   package_installed = "✓",
        --   package_pending = "➜",
        --   package_uninstalled = "✗",
        -- },
        border = defaults.border,
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        -- "typescript-language-server",
        "vtsls",
        "angular-language-server",
        "html-lsp",
        "css-lsp",
        "vim-language-server",
        "yaml-language-server",
        "json-lsp",
        "lua-language-server",
        "clangd",
        "taplo",
        "tailwindcss-language-server",
        -- "pyright",
        -- "diagnostic-languageserver",
        -- "efm",
        "vue-language-server",
        "marksman",
        "emmet-language-server",
        "astro-language-server",
        "rust-analyzer",
        "basedpyright",
        "css-variables-language-server",
        "dockerfile-language-server",
        "docker-compose-language-service",
        -- formatters
        "black",
        "sql-formatter",
        "prettier",
        "prettierd",
        "stylua",
        "autopep8",
        "eslint-lsp",
        "eslint_d",
        "ruff",
        -- DAP
        "js-debug-adapter",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = { "angularls" },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = function(client, buffer)
              if vim.tbl_contains(filter_fold_servers, client.name) then
                client.server_capabilities.foldingRangeProvider = false
              end
            end,
          })
        end,
        ["jsonls"] = function()
          require("lspconfig").jsonls.setup({
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          })
        end,
        ["html"] = function()
          require("lspconfig").html.setup({
            filetypes = { "html", "templ", "htmlangular" },
          })
        end,
        ["basedpyright"] = function()
          require("lspconfig").basedpyright.setup({
            settings = {
              basedpyright = {
                analysis = {
                  autoSearchPaths = true,
                  diagnosticMode = "openFilesOnly",
                  useLibraryCodeForTypes = true,
                  typeCheckingMode = "basic", -- ["off", "basic", "standard", "strict", "all"]
                  -- diagnosticSeverityOverrides = {
                  --   reportMissingTypeStubs = "warning",
                  --   reportUnknownMemberType = "warning",
                  -- },
                },
              },
            },
          })
        end,
      },
    },
  },
}
