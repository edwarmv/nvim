return {
  "echasnovski/mini.icons",
  enabled = false,
  config = function()
    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()
  end,
}
