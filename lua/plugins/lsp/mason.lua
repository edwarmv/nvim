return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "RubixDev/mason-update-all",
    },
    opts = {
      ui = {
        border = vim.o.winborder,
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "ts_ls",
        -- "vtsls",
        "angularls",
        "html-lsp",
        "css-lsp",
        "vim-language-server",
        "yaml-language-server",
        "json-lsp",
        "lua-language-server",
        -- "clangd",
        "taplo",
        "tailwindcss-language-server",
        -- "pyright",
        -- "diagnostic-languageserver",
        -- "efm",
        -- "vue-language-server",
        -- "marksman",
        "emmet-language-server",
        -- "astro-language-server",
        -- "rust-analyzer",
        "basedpyright",
        "css-variables-language-server",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "nomicfoundation-solidity-language-server",
        -- formatters
        "black",
        "sql-formatter",
        -- "prettier",
        "prettierd",
        "stylua",
        "autopep8",
        "eslint-lsp",
        "eslint_d",
        -- "ruff",
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
      -- "cmp-nvim-lsp",
      "saghen/blink.cmp",
    },
    config = function()
      -- local capabilities = vim.tbl_deep_extend(
      --   "force",
      --   vim.lsp.protocol.make_client_capabilities(),
      --   require("cmp_nvim_lsp").default_capabilities()
      -- )
      -- capabilities.workspace = {
      --   didChangeWatchedFiles = {
      --     dynamicRegistration = true,
      --   },
      -- }
      local capabilities = require("blink.cmp").get_lsp_capabilities({
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      })
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["jsonls"] = function()
            require("lspconfig").jsonls.setup({
              capabilities = capabilities,
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
              capabilities = capabilities,
              filetypes = { "html", "templ", "htmlangular" },
            })
          end,
          ["basedpyright"] = function()
            require("lspconfig").basedpyright.setup({
              capabilities = capabilities,
              settings = {
                basedpyright = {
                  analysis = {
                    typeCheckingMode = "off", -- ["off", "basic", "standard", "strict", "all"]
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}
