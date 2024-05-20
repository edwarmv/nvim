local defaults = require("config.defaults")

return {
  "ray-x/lsp_signature.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    max_height = math.ceil(vim.o.lines / 4), -- max height of signature floating_window
    max_width = math.ceil(vim.o.columns / 4), -- max_width of signature floating_window
    floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
    hint_enable = true, -- virtual hint enable
    hint_prefix = " 󰁔 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
    handler_opts = {
      border = defaults.border, -- double, rounded, single, shadow, none
    },
    toggle_key = "<m-x>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
    select_signature_key = "<m-n>", -- cycle to next signature, e.g. '<M-n>' function overloading
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}
