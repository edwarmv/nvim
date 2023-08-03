local defaults = require("config.defaults")
vim.api.nvim_win_set_config(vim.api.nvim_get_current_win(), { border = defaults.border })
vim.api.nvim_win_set_option(vim.api.nvim_get_current_win(), "winhl", "Normal:NormalFloat")
