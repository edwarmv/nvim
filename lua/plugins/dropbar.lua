return {
  "Bekaboo/dropbar.nvim",
  enabled = true,
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  opts = {
    general = {
      enable = function(buf, win, _)
        return vim.fn.buflisted(buf) == 1 and vim.fn.bufname(buf) ~= ""
      end,
      update_interval = 150,
    },
    update_events = {
      win = {
        "CursorMoved",
        "WinEnter",
        "WinResized",
      },
      buf = {
        "BufModifiedSet",
        "FileChangedShellPost",
        "TextChanged",
      },
      global = {
        "DirChanged",
        "VimResized",
      },
    },
    bar = {
      sources = function(buf, _)
        local sources = require("dropbar.sources")
        local utils = require("dropbar.utils")
        if vim.bo[buf].ft == "markdown" then
          return {
            sources.path,
            sources.markdown,
          }
        end
        if vim.bo[buf].buftype == "terminal" then
          return {
            sources.terminal,
          }
        end
        return {
          sources.path,
          utils.source.fallback({
            sources.lsp,
            -- sources.treesitter,
          }),
        }
      end,
    },
    icons = {
      kinds = {
        symbols = {
          Text = " ",
          Method = " ",
          Function = " ",
          Constructor = " ",
          Field = " ",
          Variable = " ",
          Class = " ",
          Interface = " ",
          Module = " ",
          Property = " ",
          Unit = " ",
          Value = " ",
          Enum = " ",
          Keyword = " ",
          Snippet = " ",
          Color = " ",
          File = " ",
          Reference = " ",
          Folder = " ",
          EnumMember = " ",
          Constant = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      },
      ui = {
        bar = {
          separator = "  ",
        },
        menu = {
          indicator = "  ",
        },
      },
    },
  },
  config = function(_, opts)
    require("dropbar").setup(opts)

    vim.keymap.set("n", "<space>w", function()
      require("dropbar.api").pick()
    end, { desc = "Dropbar - Pick" })
  end,
}
