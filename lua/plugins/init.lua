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
  -- {
  --   "preservim/vim-markdown",
  -- },
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
  -- "tpope/vim-scriptease",
  "farmergreg/vim-lastplace",
  -- "vim-scripts/restore_view.vim",
  -- "simeji/winresizer",
  -- "moll/vim-bbye",
  "famiu/bufdelete.nvim",
  "dstein64/vim-startuptime",
  {
    "gcmt/taboo.vim",
    enabled = false,
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
}
