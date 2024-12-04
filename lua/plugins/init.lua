return {
  "b0o/SchemaStore.nvim",
  { "chrisbra/csv.vim", ft = "csv" },
  { "chrisbra/recover.vim" },
  {
    init = function()
      vim.g.user_emmet_leader_key = "<m-e>"
    end,
    "mattn/emmet-vim",
  },
  {
    "godlygeek/tabular",
  },
  "tpope/vim-fugitive",
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
  },
  "fladson/vim-kitty",
  "imsnif/kdl.vim",
  "tpope/vim-sleuth",
  "tpope/vim-repeat",
  "farmergreg/vim-lastplace",
  "famiu/bufdelete.nvim",
  "dstein64/vim-startuptime",
  {
    "haya14busa/vim-asterisk",
    keys = {
      { mode = { "n", "x" }, "z#", "<Plug>(asterisk-z#)" },
      { mode = { "n", "x" }, "z*", "<Plug>(asterisk-z*)" },
    },
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
