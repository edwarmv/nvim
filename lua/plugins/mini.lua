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
  --   "echasnovski/mini.files",
  --   version = false,
  --   main = "mini.files",
  --   init = function()
  --     vim.api.nvim_create_autocmd("User", {
  --       pattern = "MiniFilesWindowOpen",
  --       callback = function(args)
  --         local win_id = args.data.win_id
  --
  --         -- Customize window-local settings
  --         -- vim.wo[win_id].winblend = 50
  --         local config = vim.api.nvim_win_get_config(win_id)
  --         -- config.border, config.title_pos = "double", "right"
  --         config.border = defaults.border
  --         vim.api.nvim_win_set_config(win_id, config)
  --       end,
  --     })
  --   end,
  --   opts = {
  --     windows = {
  --       border = defaults.border,
  --     },
  --   },
  -- },
  -- {
  --   "echasnovski/mini.pick",
  --   version = false,
  --   config = function()
  --     require("mini.pick").setup({
  --       window = {
  --         config = function()
  --           local height = math.floor(0.2 * vim.o.lines)
  --           local width = math.floor(0.3 * vim.o.columns)
  --           return {
  --             anchor = "NW",
  --             height = height,
  --             width = width,
  --             row = math.floor(0.5 * (vim.o.lines - height)),
  --             col = math.floor(0.5 * (vim.o.columns - width)),
  --             border = defaults.border,
  --           }
  --         end,
  --       },
  --     })
  --     vim.ui.select = require("mini.pick").ui_select
  --   end,
  -- },
}
