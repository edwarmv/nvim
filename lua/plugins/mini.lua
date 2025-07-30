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
  {
    "echasnovski/mini.indentscope",
    init = function()
      vim.api.nvim_create_autocmd("TermOpen", {
        desc = "Disable 'mini.indentscope' in terminal buffer",
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    opts = { symbol = "▏" },
  },
  {
    "echasnovski/mini.diff",
    opts = {
      view = { style = "number" },
      mappings = {
        apply = "",
        reset = "",
        textobject = "",
        goto_first = "",
        goto_prev = "",
        goto_next = "",
        goto_last = "",
      },
    },
    keys = {
      {
        "<leader>go",
        function()
          MiniDiff.toggle_overlay()
        end,
        desc = "[MiniDiff] - Toggle Overlay",
      },
    },
  },
  -- {
  --   "echasnovski/mini.completion",
  --   version = false,
  --   init = function()
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = { "snacks_picker_input", "sagarename" },
  --       callback = function()
  --         vim.b.minicompletion_disable = true
  --       end,
  --     })
  --   end,
  --   opts = {},
  -- },
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
  --
  --     local map_split = function(buf_id, lhs, direction)
  --       local rhs = function()
  --         -- Make new window and set it as target
  --         local cur_target = MiniFiles.get_explorer_state().target_window
  --         local new_target = vim.api.nvim_win_call(cur_target, function()
  --           vim.cmd(direction .. " split")
  --           return vim.api.nvim_get_current_win()
  --         end)
  --
  --         MiniFiles.set_target_window(new_target)
  --       end
  --
  --       -- Adding `desc` will result into `show_help` entries
  --       local desc = "Split " .. direction
  --       vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
  --     end
  --
  --     vim.api.nvim_create_autocmd("User", {
  --       pattern = "MiniFilesBufferCreate",
  --       callback = function(args)
  --         local buf_id = args.data.buf_id
  --         -- Tweak keys to your liking
  --         map_split(buf_id, "<C-s>", "belowright horizontal")
  --         map_split(buf_id, "<C-v>", "belowright vertical")
  --       end,
  --     })
  --   end,
  --   opts = {
  --     windows = {
  --       border = defaults.border,
  --       preview = true,
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>e",
  --       function()
  --         if not MiniFiles.close() then
  --           MiniFiles.open()
  --         end
  --       end,
  --       desc = "MiniFiles - Toggle",
  --     },
  --     {
  --       "<leader>E",
  --       function()
  --         MiniFiles.open(vim.api.nvim_buf_get_name(0))
  --       end,
  --       desc = "MiniFiles - Toggle",
  --     },
  --   },
  -- },
  -- {
  --   "echasnovski/mini.extra",
  --   config = function()
  --     require("mini.extra").setup({})
  --   end,
  -- },
  -- {
  --   "echasnovski/mini.pick",
  --   version = false,
  --   config = function()
  --     require("mini.pick").setup({
  --       window = {
  --         config = function()
  --           local height = math.floor(0.2 * vim.o.lines)
  --           local width = math.floor(0.5 * vim.o.columns)
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
  --   keys = {
  --     { "<leader>fe", "<cmd>Pick explorer<cr>", desc = "Pick - Explorer" },
  --     { "<leader>ff", "<cmd>Pick files<cr>", desc = "Pick - Files" },
  --     -- { "<leader>fF", "<cmd>Pick files<cr>", desc = "Pick - Files Relative Path", },
  --     { "<leader>fo", "<cmd>Pick oldfiles<cr>", desc = "Pick - Files History" },
  --     { "<leader>fb", "<cmd>Pick buffers<cr>", desc = "Pick - Buffers" },
  --     -- { "<leader>fB", "<cmd>Pick files<cr>", desc = "Pick - Buffers Relative Path", },
  --     { "<leader>fr", "<cmd>Pick grep_live<cr>", desc = "Pick - Grep" },
  --     { "<leader>fR", "<cmd>Pick grep pattern='<cword>'<cr>", desc = "Pick - Grep Live", mode = { "x" } },
  --     { "<leader>fm", "<cmd>Pick marks<cr>", desc = "Pick - Marks" },
  --     { "<leader>fk", "<cmd>Pick keymaps<cr>", desc = "Pick - Keymaps" },
  --     { "<leader>fc", "<cmd>Pick commands<cr>", desc = "Pick - Commands" },
  --     { "<leader>fls", "<cmd>Pick lsp scope='document_symbol'<cr>", desc = "Pick - LSP Document Symbols" },
  --     { "<leader>fld", "<cmd>Pick diagnostic scope='current'<cr>", desc = "Pick - Document Diagnostics" },
  --     { "<leader>flD", "<cmd>Pick diagnostic scope='all'<cr>", desc = "Pick - Workspace Diagnostics" },
  --     -- { "<leader>fgl", "<cmd>Pick files<cr>", desc = "Git Log" },
  --     -- { "<leader>fgs", "<cmd>Pick files<cr>", desc = "Git Status" },
  --   },
  -- },
}
