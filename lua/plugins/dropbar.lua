return {
  "Bekaboo/dropbar.nvim",
  enabled = true,
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  opts = {
    general = {
      enable = function(buf, win, _)
        return vim.fn.win_gettype(win) == ""
          and vim.wo[win].winbar == ""
          and vim.bo[buf].bt == ""
          and (
            vim.bo[buf].ft == "markdown"
            or (
              buf
                and vim.api.nvim_buf_is_valid(buf)
                -- and (pcall(vim.treesitter.get_parser, buf, vim.bo[buf].ft))
                and true
              or false
            )
          )
      end,
      update_interval = 150,
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
