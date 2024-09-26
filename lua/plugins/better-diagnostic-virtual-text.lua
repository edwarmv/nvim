return {
  "sontungexpt/better-diagnostic-virtual-text",
  enabled = false,
  event = "LspAttach",
  config = function(_)
    require("better-diagnostic-virtual-text").setup({})
  end,
}
