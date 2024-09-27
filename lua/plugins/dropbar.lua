local defaults = require("config.defaults")

local exclude_ft = {
  "oil",
}

return {
  "Bekaboo/dropbar.nvim",
  enabled = true,
  -- dependencies = {
  --   "nvim-telescope/telescope-fzf-native.nvim",
  -- },
  opts = {
    general = {
      enable = function(buf, win)
        return vim.fn.buflisted(buf) == 1
          and vim.fn.win_gettype(win) == ""
          and vim.wo[win].winbar == ""
          and vim.bo[buf].bt == ""
          and vim.api.nvim_buf_get_name(buf) ~= ""
          and not vim.tbl_contains(exclude_ft, vim.bo[buf].ft)
      end,
      update_interval = defaults.lsp_debounce,
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
    },
  },
  config = function(_, opts)
    require("dropbar").setup(opts)

    vim.keymap.set("n", "<space>w", function()
      require("dropbar.api").pick()
    end, { desc = "Dropbar - Pick" })
  end,
}
