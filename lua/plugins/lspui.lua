return {
  "jinzhongjia/LspUI.nvim",
  enabled = false,
  branch = "main",
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
