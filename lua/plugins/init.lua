local utils = require("utils.init")

local plugins = {
  -- "winresizer.vim",
  "vim-visual-multi.vim",
  "emmet-vim.vim",
  -- "vim-markdown.vim",
  "init.vim",
}

for _, v in ipairs(plugins) do
  utils.sourceVim(v)
end

return {
  "b0o/SchemaStore.nvim",
  "seandewar/killersheep.nvim",
  { "chrisbra/csv.vim", ft = "csv" },
  { "chrisbra/recover.vim" },
  -- {
  --   "preservim/vim-markdown",
  -- },
  {
    "godlygeek/tabular",
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
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
  "vim-scripts/restore_view.vim",
  -- "simeji/winresizer",
  "moll/vim-bbye",
  {
    "gcmt/taboo.vim",
    config = function()
      vim.g.taboo_tabline = 0
    end,
  },
}
