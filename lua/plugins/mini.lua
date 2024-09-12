local defaults = require("config.defaults")

return {
  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  -- {
  --   "echasnovski/mini.notify",
  --   version = false,
  --   config = function()
  --     require("mini.notify").setup({
  --       lsp_progress = { enable = false },
  --       { window = { config = { border = defaults.border } } },
  --     })
  --     vim.notify = require("mini.notify").make_notify
  --   end,
  -- },
  -- {
  --   "echasnovski/mini.pick",
  --   version = false,
  --   config = function()
  --     require("mini.pick").setup({ window = { config = { border = defaults.border } } })
  --     vim.ui.select = require("mini.pick").ui_select
  --   end,
  -- },
}
