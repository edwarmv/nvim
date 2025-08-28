return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  depependencies = {
    "saghen/blink.cmp",
    -- "cmp-nvim-lsp",
  },
  config = function()
    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- capabilities.workspace = {
    --   didChangeWatchedFiles = {
    --     dynamicRegistration = true,
    --   },
    -- }
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(), {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
        fileOperations = {
          didRename = true,
          willRename = true,
        },
      },
    })
    vim.lsp.config("*", {
      capabilities = capabilities,
    })
  end,
  -- requires = { "editorconfig/editorconfig-vim" },
}
