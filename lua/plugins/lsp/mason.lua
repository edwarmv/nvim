return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "RubixDev/mason-update-all",
      opts = {},
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
      ensure_installed = {
        "bashls",
        -- "ts_ls",
        "vtsls",
        "angularls",
        "html",
        "cssls",
        "vimls",
        "yamlls",
        "jsonls",
        "lua_ls",
        "taplo",
        "tailwindcss",
        "emmet_language_server",
        "astro",
        "basedpyright",
        "css_variables",
        "dockerls",
        "docker_compose_language_service",
        "solidity_ls_nomicfoundation",
      },
    },
  },
}
