return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, {
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
