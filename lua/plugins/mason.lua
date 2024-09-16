local defaults = require("config.defaults")

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
        "typescript-language-server",
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
        "pyright",
        "diagnostic-languageserver",
        "efm",
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
          require("lspconfig")[server_name].setup({})
        end,
      },
    },
  },
}
