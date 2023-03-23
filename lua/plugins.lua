-- vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "12.3.1")
vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "12.6")
return require("packer").startup(function(use)
  -- packer
  use("wbthomason/packer.nvim")

  -----------------
  -- LSP Plugins --
  -----------------
  --{{{
  use({
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  })

  use({
    "jose-elias-alvarez/typescript.nvim",
    requires = "nvim-lspconfig",
  })

  use({
    "theHamsta/nvim-semantic-tokens",
    config = [[require("config.nvim-semantic-tokens")]],
  })

  -- use({
  --   "glepnir/lspsaga.nvim",
  --   branch = "main",
  --   config = [[require('config.lspsaga')]],
  -- })

  use({
    "stevearc/aerial.nvim",
    config = [[require("config.aerial")]],
  })

  -- use({
  --   "kosayoda/nvim-lightbulb",
  --   config = [[require("config.nvim-lightbulb")]],
  -- })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = [[require("config.null-ls")]],
  })

  use({
    "j-hui/fidget.nvim",
    config = [[require("config.fidget")]],
  }) -- LSP progress

  use({
    "b0o/SchemaStore.nvim",
  })

  use({
    "folke/trouble.nvim",
    -- "~/github/trouble.nvim/",
    config = [[require("config.trouble")]],
  })

  use({
    "neovim/nvim-lspconfig",
    -- requires = { "editorconfig/editorconfig-vim" },
    config = [[require("config.nvim-lspconfig")]],
  }) -- lsp configuration

  -- use({
  --   "neoclide/coc.nvim",
  --   branch = "master",
  --   run = "yarn install --frozen-lockfile",
  --   config = [[require("config.coc")]],
  --   requires = { "rafamadriz/friendly-snippets" },
  --   -- lock = true,
  --   -- disable = true,
  -- })

  use({
    "williamboman/mason.nvim",
    requires = {
      -- "williamboman/mason-lspconfig.nvim",
      "RubixDev/mason-update-all",
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = [[require("config.mason-tool-installer")]],
      },
    },
    config = [[require("config.mason")]],
  })

  ---@diagnostic disable-next-line: undefined-global
  use_rocks("penlight")
  ---@diagnostic disable-next-line: undefined-global
  -- use_rocks("rxlua")
  ---@diagnostic disable-next-line: undefined-global
  -- use_rocks("luv")

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-calc",
      -- "ray-x/cmp-treesitter",
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
      {
        "saadparwaiz1/cmp_luasnip",
        requires = {
          {
            "L3MON4D3/LuaSnip",
            config = [[require("config.LuaSnip")]],
            requires = { "rafamadriz/friendly-snippets" },
          },
        },
      },
    },
    config = [[require("config.nvim-cmp")]],
  })

  use({
    "rmagatti/goto-preview",
    config = [[require("config.goto-preview")]],
  }) -- definition & implementation preview

  use({
    "onsails/lspkind-nvim",
    config = [[require("config.lspkind-nvim")]],
  }) -- autocompletion icons

  use({
    "ray-x/lsp_signature.nvim",
    config = [[require("config.lsp_signature")]],
  }) -- display signature help in floating window
  --}}}

  --------------------------
  -- Fuzzy Finder Plugins --
  --------------------------
  ---{{{
  -- use({
  --   "ibhagwan/fzf-lua",
  --   config = [[require("config.fzf-lua")]],
  -- })

  -- use({
  --   "antoinemadec/coc-fzf",
  --   config = [[require("config.coc-fzf")]],
  -- })

  use({
    "junegunn/fzf",
    -- run = "./install --bin",
    -- run = function()
    --   vim.fn["fzf#install"]()
    -- end,
    -- "/usr/local/opt/fzf",
    requires = {
      { "junegunn/fzf.vim", config = [[require("config.fzf")]] },
      "gfanto/fzf-lsp.nvim",
    },
  })

  use({
    "nvim-telescope/telescope.nvim",
    -- "~/github/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = [[require("config.telescope")]],
  })
  --}}}

  --------------------
  -- Motion Plugins --
  --------------------
  --{{{
  -- use({
  --   "t9md/vim-choosewin",
  -- }) -- splits and tabs motion

  -- use({
  --   "s1n7ax/nvim-window-picker",
  --   requires = {
  --     {
  --       "wesQ3/vim-windowswap",
  --     },
  --   },
  --   config = [[require("config.nvim-window-picker")]],
  -- })

  use({
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    requires = {
      {
        "wesQ3/vim-windowswap",
      },
    },
    config = [[require("config.nvim-window")]],
  })

  -- use({
  --   "gbrlsnchs/winpick.nvim",
  --   requires = {
  --     {
  --       "wesQ3/vim-windowswap",
  --     },
  --   },
  --   config = [[require("config.winpick")]],
  -- })

  -- use({
  --   "ggandor/lightspeed.nvim",
  --   config = [[require("config.lightspeed")]],
  -- })

  -- use({
  --   "declancm/cinnamon.nvim",
  --   config = [[require("config.cinnamon")]],
  -- }) -- animated moves

  use({
    "ggandor/leap.nvim",
    requires = {
      {
        "ggandor/flit.nvim",
        config = [[require("config.flit")]],
      },
    },
    config = [[require("config.leap")]],
  })

  use({
    "phaazon/hop.nvim",
    config = [[require("config.hop")]],
  }) -- easy-motion repleace
  --}}}

  --------------------------
  -- File Maganer Plugins --
  --------------------------
  --{{{
  use({
    "elihunter173/dirbuf.nvim",
    config = [[require("config.dirbuf")]],
  })

  -- use({
  --   "nvim-tree/nvim-tree.lua",
  --   config = [[require("config.nvim-tree")]],
  -- }) -- file manager

  use({
    "is0n/fm-nvim",
    config = [[require("config.fm-nvim")]],
  })

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "main",
    -- branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        config = [[require("config.nvim-window-picker")]],
      },
    },
    config = [[require("config.neo-tree")]],
  })
  --}}}

  ----------------
  -- UI Plugins --
  ----------------
  --{{{
  -- use({
  --   "mvllow/modes.nvim",
  --   config = [[require("config.modes")]],
  -- })

  -- use({
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = [[require("config.colorful-winsep")]],
  -- })

  use({
    "rcarriga/nvim-notify",
    config = [[require("config.nvim-notify")]],
  })

  -- use({
  --   "folke/noice.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --     {
  --       "smjonas/inc-rename.nvim",
  --       config = [[require("config.inc-rename")]],
  --     },
  --   },
  --   config = [[require("config.noice")]],
  -- })

  -- use({
  --   "vigoux/notifier.nvim",
  --   config = [[require("config.notifier")]],
  -- })

  use({
    "b0o/incline.nvim",
    config = [[require("config.incline")]],
  })

  use({
    "stevearc/dressing.nvim",
    config = [[require("config.dressing")]],
  })

  use({
    "nvim-lualine/lualine.nvim",
    -- requires = { "arkav/lualine-lsp-progress" },
    config = [[require("config.lualine")]],
    -- commit = "8d956c18258bb128ecf42f95411bb26efd3a5d23",
  }) -- statusline plugin

  -- use({
  --   "feline-nvim/feline.nvim",
  --   requires = {
  --     "kyazdani42/nvim-web-devicons",
  --   },
  --   config = [[require("config.feline")]],
  -- })

  -- use({
  --   "ghillb/cybu.nvim",
  --   config = [[require("config.cybu")]]
  -- }) -- cycle buffers

  -- use({
  --   "ziontee113/color-picker.nvim",
  --   config = [[require("config.color-picker")]],
  -- })

  -- use({
  --   "glepnir/dashboard-nvim",
  --   config = [[require("config.dashboard-nvim")]],
  -- })

  -- use({
  --   "akinsho/nvim-bufferline.lua",
  --   config = [[require("config.bufferline")]],
  -- }) -- displays buffers in tab line

  -- use({
  --   "nanozuki/tabby.nvim",
  --   config = [[require("config.tabby")]],
  -- })
  --}}}

  ------------------
  -- Colorschemes --
  ------------------
  --{{{
  use({
    "sainnhe/gruvbox-material",
  })

  -- use({
  --   "sainnhe/everforest",
  -- })

  -- use({
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   config = [[require("config.catppuccin")]],
  -- })

  -- use({
  --   "folke/tokyonight.nvim",
  --   config = [[require("config.tokyonight")]],
  -- })

  -- use({
  --   "ful1e5/onedark.nvim",
  --   -- "~/github/forks/onedark.nvim",
  --   config = [[require("config.onedark")]],
  -- })

  -- use({
  --   "~/Downloads/Dracula PRO — Zeno Rocha/themes/vim",
  --   as = "dracula_pro",
  -- })

  -- use({
  --   "olimorris/onedarkpro.nvim",
  --   config = [[require('config.onedarkpro')]],
  -- })
  --}}}

  -----------------------
  -- Filetypes plugins --
  -----------------------
  --{{{
  use({ "chrisbra/csv.vim", ft = "csv" }) -- csv

  use({
    "preservim/vim-markdown",
    config = [[require("config.vim-markdown")]],
    requires = {
      "godlygeek/tabular",
      {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
      },
    },
  })

  --use({
  --  "iamcco/markdown-preview.nvim",
  --  run = "cd app && yarn install",
  --})
  --}}}

  -----------------
  -- git Plugins --
  -----------------
  --{{{
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = [[require("config.gitsigns")]],
  }) -- git status on signcolumn

  -- use({
  --   "tanvirtin/vgit.nvim",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = [[require("config.vgit")]]
  -- })

  use({
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require("config.diffview")]],
  }) -- diffs view

  use({
    "akinsho/git-conflict.nvim",
    tag = "*",
    config = [[require("config.git-conflict")]],
  })

  use({
    "tpope/vim-fugitive",
  })
  --}}}

  ---------------------
  -- nvim-treesitter --
  ---------------------
  --{{{
  use({
    -- "~/github/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter",
    requires = {
      {
        "nvim-treesitter/playground",
      },
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
      },
      -- "nvim-treesitter/nvim-treesitter-angular",
    },
    config = [[require("config.treesitter")]],
  })

  -- use({
  --   "windwp/nvim-ts-autotag",
  --   config = [[require("config.nvim-ts-autotag")]],
  -- })
  --}}}

  ----------------------
  -- languages syntax --
  ----------------------
  --{{{
  -- use({
  --   "HerringtonDarkholme/yats.vim",
  -- })

  -- use({
  --   "othree/html5.vim",
  -- })
  --
  -- use({
  --   "cakebaker/scss-syntax.vim",
  --   requires = { "hail2u/vim-css3-syntax" },
  -- })

  -- use({
  --   "kevinoid/vim-jsonc",
  -- })

  -- use({
  --   "othree/yajs.vim",
  -- })

  use({
    "weirongxu/plantuml-previewer.vim",
    requires = {
      -- "aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
  })

  use({
    "fladson/vim-kitty",
  })

  use("sheerun/vim-polyglot")

  -- use("MaxMEllon/vim-jsx-pretty")
  --}}}

  ----------------------
  -- awesome neovim --
  ----------------------
  --{{{
  use({
    "gbprod/substitute.nvim",
    config = [[require("config.substitute")]],
  })

  -- use({
  --   "kevinhwang91/nvim-hlslens",
  --   config = [[require("config.nvim-hlslens")]],
  -- })

  use({
    "folke/which-key.nvim",
    config = [[require("config.which-key")]],
  })

  use({
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = [[require("config.rest")]],
    ft = "http",
  })

  -- use("vimwiki/vimwiki")

  use("tpope/vim-sleuth")

  use({
    "tpope/vim-eunuch",
    config = [[require("config.vim-eunuch")]],
  })

  use("dhruvasagar/vim-zoom")

  -- use({
  --   "beauwilliams/focus.nvim",
  --   config = [[require('config.focus')]],
  -- })

  use({
    "natecraddock/workspaces.nvim",
    config = [[require("config.workspaces")]],
  })

  use({
    "anuvyklack/hydra.nvim",
    config = [[require("config.hydra")]],
  })

  use("tpope/vim-repeat")

  -- use({
  --   "AckslD/nvim-neoclip.lua",
  --   requires = {
  --     { "tami5/sqlite.lua", module = "sqlite" },
  --     -- { "ibhagwan/fzf-lua" },
  --     {
  --       "gbprod/cutlass.nvim",
  --       config = [[require("config.cutlass")]],
  --     },
  --   },
  --   config = [[require("config.nvim-neoclip")]],
  -- })

  use({
    "gbprod/yanky.nvim",
    requires = {
      {
        "gbprod/cutlass.nvim",
        config = [[require("config.cutlass")]],
      },
    },
    config = [[require("config.yanky")]],
  })

  use({
    "tpope/vim-scriptease",
  })

  use({
    "RRethy/vim-illuminate",
    config = [[require("config.vim-illuminate")]],
  })

  -- use({
  --   "RRethy/vim-hexokinase",
  --   run = "make hexokinase",
  -- })

  use({
    "uga-rosa/ccc.nvim",
    config = [[require("config.ccc")]],
  }) -- color highlighter

  -- use({
  --   "vim-scripts/restore_view.vim",
  -- })

  use({
    "farmergreg/vim-lastplace",
  })

  -- use({
  --   "ethanholz/nvim-lastplace",
  --   config = [[require("config.nvim-lastplace")]],
  -- })

  use({
    "simeji/winresizer",
  })

  use({
    "matze/vim-move",
    config = [[require("config.vim-move")]],
  }) -- easy line moving

  -- use({
  --   "booperlv/nvim-gomove",
  --   config = [[require("config.nvim-gomove")]],
  -- }) -- move lines

  use({
    "ntpeters/vim-better-whitespace",
    config = [[require("config.vim-better-whitespace")]],
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = [[require("config.indent-blankline")]],
  }) -- display indent lines

  use({
    "mattn/emmet-vim",
    event = "VimEnter",
  }) -- emmet

  use({
    "andymass/vim-matchup",
    event = "VimEnter",
  }) -- enhance % key

  use({
    "windwp/nvim-autopairs",
    event = "VimEnter",
    config = [[require("config.nvim-autopairs")]],
  }) -- autopairs

  use({
    "nvim-tree/nvim-web-devicons",
    config = [[require("config.nvim-web-devicons")]],
  })

  use({
    "mg979/vim-visual-multi",
    -- event = "VimEnter",
  }) -- multi cursor

  use({
    "numToStr/Comment.nvim",
    requires = { "Shougo/context_filetype.vim" },
    event = "VimEnter",
    config = [[require("config.comment")]],
  }) -- comentary plugin

  use({
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = [[require("config.nvim-bqf")]],
  })

  -- use({
  --   "machakann/vim-sandwich",
  --   -- config = [[require("config.vim-sandwich")]],
  -- }) -- sorround plugin

  use({
    "kylechui/nvim-surround",
    config = [[require("config.nvim-surround")]],
  })

  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require("config.todo-comments")]],
  })

  use({
    "tpope/vim-obsession",
    config = [[require("config.vim-obsession")]],
  })

  -- use({
  --   "rmagatti/auto-session",
  --   config = [[require("config.auto-session")]],
  -- })

  -- use("famiu/bufdelete.nvim")

  use("moll/vim-bbye")

  -- use({
  --   "gbprod/stay-in-place.nvim",
  --   config = [[require("config.stay-in-place")]],
  -- })

  -- use("voldikss/vim-floaterm") -- float term

  -- use({
  --   "tversteeg/registers.nvim",
  --   config = [[require("config.registers")]],
  -- })

  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = [[require("config.toggleterm")]],
  })

  -- use({
  --   "nvim-neorg/neorg",
  --   -- tag = "*",
  --   -- ft = "norg",
  --   after = {"nvim-treesitter", "telescope.nvim"}, -- You may want to specify Telescope here as well
  --   config = [[require("config.neorg")]],
  -- })

  -- use({
  --   "tpope/vim-dadbod",
  --   requires = {
  --     "kristijanhusak/vim-dadbod-ui",
  --     "kristijanhusak/vim-dadbod-completion",
  --   },
  --   config = [[require("config.vim-dadbod")]],
  -- }) -- database manager

  -- use("nanotee/sqls.nvim")
  --}}}
end)

-- vim: foldmethod=marker
