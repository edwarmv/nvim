local saga = require("lspsaga")
local icons = require("icons")

saga.init_lsp_saga({
  border_style = "single",
  diagnostic_header = {
    icons.diagnostic.error,
    icons.diagnostic.warn,
    icons.diagnostic.info,
    icons.diagnostic.hint,
  },
  code_action_icon = "",
  code_action_lightbulb = {
    enable = true,
    enable_in_insert = false,
    cache_code_action = true,
    sign = false,
    update_time = 150,
    sign_priority = 200,
    virtual_text = true,
  },
})
