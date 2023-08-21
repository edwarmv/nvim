return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  depencies = { "neovim/nvim-lspconfig" },
  enabled = true,
  event = "LspAttach",
  config = function()
    require("lsp_lines").setup()
    local enabled = false
    vim.keymap.set("", "<Leader>D", function()
      enabled = not enabled
      if enabled then
        vim.diagnostic.config({ virtual_lines = true, virtual_text = false })
      else
        vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
      end
    end, { desc = "[lsp_lines] - Toggle" })

    -- local group = vim.api.nvim_create_augroup("LspLinesToggleInsert", { clear = false })
    --
    -- vim.api.nvim_create_autocmd("InsertEnter", {
    --   group = group,
    --   callback = function()
    --     vim.diagnostic.config({ virtual_lines = false })
    --   end,
    -- })
    --
    -- vim.api.nvim_create_autocmd("InsertLeave", {
    --   group = group,
    --   callback = function()
    --     if enabled then
    --       vim.diagnostic.config({ virtual_lines = true })
    --     end
    --   end,
    -- })

    -- vim.api.nvim_create_autocmd("WinEnter", {
    --   group = group,
    --   callback = function()
    --     if enabled then
    --       vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
    --     end
    --   end,
    -- })
  end,
}
