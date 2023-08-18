local maps = require("config.maps")

return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    on_attach = function(client, bufnr)
      maps.lsp(bufnr)
    end,
  },
}
