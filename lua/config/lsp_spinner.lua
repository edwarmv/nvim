local lsp_spinner = require("lsp_spinner")

-- register an handler for `$/progress` method
-- options are optional
lsp_spinner.setup({
  spinner = {
    "⠋",
    "⠙",
    "⠹",
    "⠸",
    "⠼",
    "⠴",
    "⠦",
    "⠧",
    "⠇",
    "⠏",
  },
  interval = 80, -- spinner frame rate in ms
  redraw_rate = 100, -- max refresh rate of statusline in ms
  placeholder = "", -- it will be displayed when there is no activity
})
