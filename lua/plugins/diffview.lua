return {
  "sindrets/diffview.nvim",
  config = function()
    -- local Panel = require("diffview.ui.panel").Panel
    -- Panel.default_config_float = {
    --   type = "float",
    --   relative = "editor",
    --   row = 0,
    --   col = 0,
    --   zindex = 50,
    --   style = "minimal",
    --   border = "rounded",
    --   win_opts = {},
    -- }
    --
    require("diffview").setup()
  end,
}
