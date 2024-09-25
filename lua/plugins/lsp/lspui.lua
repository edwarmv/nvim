return {
  "jinzhongjia/LspUI.nvim",
  enabled = false,
  config = function()
    require("LspUI").setup({
      hover = {
        command_enable = true,
      },
      lightbulb = {
        enable = false,
      },
      inlay_hint = {
        enable = false,
      },
    })
  end,
}
