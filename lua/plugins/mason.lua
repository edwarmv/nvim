local defaults = require("config.defaults")

return {
  "williamboman/mason.nvim",
  dependencies = {
    -- "williamboman/mason-lspconfig.nvim",
    "RubixDev/mason-update-all",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
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
}
