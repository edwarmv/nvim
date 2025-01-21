return {
  "tpope/vim-sleuth",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  {
    "tpope/vim-eunuch",
    init = function()
      vim.g.eunuch_no_maps = 1
    end,
  },
  {
    "tpope/vim-obsession",
    init = function()
      vim.g.obsession_no_bufenter = true
    end,
  },
  "tpope/vim-unimpaired",
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
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
  },
  "fladson/vim-kitty",
  "imsnif/kdl.vim",
  "farmergreg/vim-lastplace",
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
