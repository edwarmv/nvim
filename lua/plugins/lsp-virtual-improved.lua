return {
  "luozhiya/lsp-virtual-improved.nvim",
  enabled = true,
  event = { "LspAttach" },
  config = function()
    require("lsp-virtual-improved").setup()
  end,
}
