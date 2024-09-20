local defaults = require("config.defaults")

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "ibhagwan/fzf-lua",
    -- "rcarriga/nvim-notify",
  },
  enabled = true,
  opts = {
    messages = {
      enabled = true,
      view_search = "virtualtext",
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = {
        enabled = false,
      },
      hover = {
        enabled = false,
        silent = true,
      },
      signature = {
        enabled = false,
      },
    },
    presets = {
      long_message_to_split = true,
      bottom_search = true,
      command_palette = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    routes = {
      {
        filter = {
          event = "notify",
          any = {
            { find = "No signature help available" },
            { find = "No information available" },
            { find = "WARNING: vim.treesitter.get_parser will return nil instead of raising an error in Neovim 0.12" },
          },
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          kind = "warn",
          cond = function(message)
            return message.opts.title == "Neogit"
          end,
        },
        opts = { skip = true },
      },
    },
  },
  keys = {
    { "<space>fn", "<cmd>Noice fzf<cr>", desc = "FZF - Noice Messages" },
  },
}
