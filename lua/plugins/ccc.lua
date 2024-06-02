return {
  "uga-rosa/ccc.nvim",
  enabled = false,
  config = function()
    local defaults = require("config.defaults")
    local ccc = require("ccc")
    local mapping = ccc.mapping
    ccc.setup({
      filetypes = {},
      excludes = { "dirbuf" },
      highlighter = {
        auto_enable = false,
        lsp = false,
      },
      win_opts = {
        border = defaults.border,
      },
    })
  end,
}
