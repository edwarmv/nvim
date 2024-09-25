local utils = require("utils.init")

local plugins = {
  -- "winresizer.vim",
  "vim-visual-multi.vim",
  -- "vim-markdown.vim",
  "init.vim",
}

for _, v in ipairs(plugins) do
  utils.sourceVim(v)
end

return {
  "b0o/SchemaStore.nvim",
  { "chrisbra/csv.vim", ft = "csv" },
  { "chrisbra/recover.vim" },
  {
    "tummetott/reticle.nvim",
    event = "VeryLazy", -- optionally lazy load the plugin
    opts = {},
  },
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
  "machakann/vim-highlightedyank",
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
  -- {
  --   "gcmt/taboo.vim",
  --   init = function()
  --     vim.g.taboo_tabline = 0
  --   end,
  -- },
}
