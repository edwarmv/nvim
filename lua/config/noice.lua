require("noice").setup({
  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
  },
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = true, -- enables the Noice messages UI
    view = "notify", -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify", -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = false, -- view for search count messages. Set to `false` to disable
  },
  popupmenu = {
    enabled = true, -- enables the Noice popupmenu UI
    ---@type 'nui'|'cmp'
    backend = "cmp",
  },
  notify = {
    -- Noice can be used as `vim.notify` so you can route any notification like other messages
    -- Notification messages have their level and other properties set.
    -- event is always "notify" and kind can be any log level as a string
    -- The default routes will forward notifications to nvim-notify
    -- Benefit of using Noice for this is the routing and consistent history view
    enabled = true,
    view = "notify",
  },
  lsp = {
    progress = {
      enabled = false,
    },
    override = {
      -- override the default lsp markdown formatter with Noice
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      -- override the lsp markdown formatter with Noice
      ["vim.lsp.util.stylize_markdown"] = true,
      -- override cmp documentation with Noice (needs the other options to work)
      ["cmp.entry.get_documentation"] = false,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    message = {
      -- Messages shown by lsp servers
      enabled = true,
      view = "notify",
      opts = {},
    },
  },
  presets = {
    -- you can enable a preset by setting it to true, or a table that will override the preset config
    -- you can also add custom presets that you can enable/disable with enabled=true
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
    cmdline_output_to_split = false, -- send the output of a command you executed in the cmdline to a split
  },
  throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
  views = {
    split = {
      enter = true,
    },
    cmdline_popup = {
      border = {
        style = "single",
      },
      size = {
        min_width = 0,
        width = "40%",
        height = "auto",
      },
    },
    popup = {
      border = {
        style = "single",
      },
      size = {
        width = "70%",
        height = "70%",
      },
    },
    confirm = {
      border = {
        style = "single",
      },
    },
  },
  routes = {
    -- {
    --   view = "notify",
    --   filter = { event = "msg_showmode" },
    -- },
    {
      filter = {
        event = "msg_show",
        min_height = 3,
      },
      view = "split",
    },
  },
  status = {},
  format = {},
})

-- vim.api.nvim_create_autocmd("VimResized", {
--   callback = function()
--     require("noice.view.nui"):update_layout()
--   end,
-- })
