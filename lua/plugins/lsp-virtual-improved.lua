return {
  "luozhiya/lsp-virtual-improved.nvim",
  enabled = false,
  event = { "LspAttach" },
  config = function()
    require("lsp-virtual-improved").setup()
  end,
}
