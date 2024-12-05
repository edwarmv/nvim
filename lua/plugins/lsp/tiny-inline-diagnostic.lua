local defaults = require("config.defaults")

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VimEnter",
  opts = {
    preset = "classic",
    throttle = defaults.lsp_debounce,
  },
  config = function(_, opts)
    require("tiny-inline-diagnostic").setup(opts)

    vim.api.nvim_create_autocmd("InsertEnter", {
      callback = function()
        require("tiny-inline-diagnostic").disable()
      end,
    })
    vim.api.nvim_create_autocmd("InsertLeave", {
      callback = function()
        require("tiny-inline-diagnostic").enable()
      end,
    })
  end,
}
