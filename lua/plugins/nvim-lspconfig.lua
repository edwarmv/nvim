return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "folke/neodev.nvim",
  },
  -- requires = { "editorconfig/editorconfig-vim" },
  config = function()
    -- require("lspconfig")

    -- local function filter_client(list, val)
    --   for _, value in ipairs(list) do
    --     if value == val then
    --       return false
    --     end
    --   end
    --   return true
    -- end

    -- vim.lsp.buf.format({
    --   filter = function(client)
    --     return filter_client({
    --       "tsserver",
    --       "angularls",
    --       "html",
    --       "cssls",
    --       "jsonls",
    --       "yamls",
    --       "tailwindcss",
    --     }, client.name)
    --   end,
    -- })
  end,
}
