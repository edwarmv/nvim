return {
  "uga-rosa/ccc.nvim",
  config = function()
    local defaults = require("config.defaults")
    local ccc = require("ccc")
    local mapping = ccc.mapping
    ccc.setup({
      filetypes = {},
      excludes = { "dirbuf" },
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
      win_opts = {
        border = defaults.border,
      },
    })
  end,
}
