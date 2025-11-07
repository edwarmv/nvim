return {
  -- "tpope/vim-sleuth",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  {
    "tpope/vim-eunuch",
    init = function()
      vim.g.eunuch_no_maps = 1
    end,
  },
  "tpope/vim-obsession",
  "tpope/vim-unimpaired",
  "tpope/vim-abolish",
  "b0o/SchemaStore.nvim",
  "neoclide/jsonc.vim",
  { "NMAC427/guess-indent.nvim", name = "guess-indent", opts = {} },
  { "chrisbra/csv.vim", ft = "csv" },
  -- { "chrisbra/recover.vim" },
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
  -- "zhimsel/vim-stay",
  "farmergreg/vim-lastplace",
  {
    "haya14busa/vim-asterisk",
    keys = {
      { mode = { "n", "x" }, "z#", "<Plug>(asterisk-z#)" },
      { mode = { "n", "x" }, "z*", "<Plug>(asterisk-z*)" },
    },
  },
  -- {
  --   "sphamba/smear-cursor.nvim",
  --   opts = {},
  -- },
  -- better gf gF,
  {
    "HawkinsT/pathfinder.nvim",
    opts = {
      open_mode = "tab split",
    },
  },
}
