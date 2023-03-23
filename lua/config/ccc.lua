-- Enable true color
vim.opt.termguicolors = true

local ccc = require("ccc")
local mapping = ccc.mapping
ccc.setup({
  -- Your favorite settings
  highlighter = {
    auto_enable = true,
  },
  win_opts = {
    border = "single",
  }
})
