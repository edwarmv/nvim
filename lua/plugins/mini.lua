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
  {
    "echasnovski/mini.files",
    version = false,
    main = "mini.files",
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesWindowOpen",
        callback = function(args)
          local win_id = args.data.win_id

          -- Customize window-local settings
          -- vim.wo[win_id].winblend = 50
          local config = vim.api.nvim_win_get_config(win_id)
          -- config.border, config.title_pos = "double", "right"
          config.border = defaults.border
          vim.api.nvim_win_set_config(win_id, config)
        end,
      })

      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local cur_target = MiniFiles.get_explorer_state().target_window
          local new_target = vim.api.nvim_win_call(cur_target, function()
            vim.cmd(direction .. " split")
            return vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target)
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = "Split " .. direction
        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak keys to your liking
          map_split(buf_id, "<C-s>", "belowright horizontal")
          map_split(buf_id, "<C-v>", "belowright vertical")
        end,
      })
    end,
    opts = {
      windows = {
        border = defaults.border,
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          if not MiniFiles.close() then
            MiniFiles.open()
          end
        end,
        desc = "MiniFiles - Toggle",
      },
      {
        "<leader>E",
        function()
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end,
        desc = "MiniFiles - Toggle",
      },
    },
  },
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
