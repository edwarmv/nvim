return {
  "Bekaboo/dropbar.nvim",
  enabled = false,
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  opts = {
    general = {
      enable = function(buf, win, _)
        return vim.fn.buflisted(buf) == 1
      end,
      update_interval = 300,
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
