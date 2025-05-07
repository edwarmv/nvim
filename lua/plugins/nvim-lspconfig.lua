return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  depependencies = {
    "saghen/blink.cmp",
    -- "cmp-nvim-lsp",
  },
  config = function()
    --   -- local capabilities = vim.tbl_deep_extend(
    --   --   "force",
    --   --   vim.lsp.protocol.make_client_capabilities(),
    --   --   require("cmp_nvim_lsp").default_capabilities()
    --   -- )
    --   -- capabilities.workspace = {
    --   --   didChangeWatchedFiles = {
    --   --     dynamicRegistration = true,
    --   --   },
    --   -- }
    local capabilities = require("blink.cmp").get_lsp_capabilities({
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    })
    vim.lsp.config("*", {
      capabilities = capabilities,
    })
  end,
  -- requires = { "editorconfig/editorconfig-vim" },
}
