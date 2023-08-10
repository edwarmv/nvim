return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  depencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("lsp_lines").setup()
    local enabled = true;
    vim.keymap.set("", "<Leader>D", function()
      enabled = not enabled
      if enabled then
        vim.diagnostic.config({ virtual_lines = { only_current_line = enabled } })
      else
        vim.diagnostic.config({ virtual_lines = false })
      end
    end, { desc = "[lsp_lines] - Toggle" })
  end,
}
