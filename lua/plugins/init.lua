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
  "b0o/SchemaStore.nvim",
  "neoclide/jsonc.vim",
  { "NMAC427/guess-indent.nvim", name = "guess-indent", opts = {} },
  { "chrisbra/csv.vim", ft = "csv" },
  -- { "chrisbra/recover.vim" },
  -- {
  --   init = function()
  --     vim.g.user_emmet_leader_key = "<m-e>"
  --   end,
  --   "mattn/emmet-vim",
  -- },
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
  {
    "gcmt/taboo.vim",
    enabled = true,
    init = function()
      vim.g.taboo_tabline = 0
      vim.keymap.set("n", "<leader>tr", function()
        vim.ui.input({ prompt = "Enter The Tab Name: " }, function(name)
          vim.cmd("TabooRename " .. name)
        end)
      end, { desc = "Rename Tab" })
      vim.keymap.set("n", "<leader>tR", "<cmd>TabooReset<cr>", { desc = "Reset Tab Name" })
    end,
  },
  -- better gf gF,
  { "HawkinsT/pathfinder.nvim" },
}
