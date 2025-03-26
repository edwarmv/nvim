return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    dim_inactive = {
      enabled = true, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    flavour = "macchiato",
    integrations = {
      mason = true,
      flash = true,
      gitsigns = true,
      hop = true,
      neotree = true,
      noice = true,
      cmp = true,
      navic = {
        enabled = true,
        custom_bg = "NONE", -- "lualine" will set background to mantle
      },
      notify = true,
      semantic_tokens = true,
      treesitter = true,
      telescope = {
        enabled = true,
        -- style = "nvchad"
      },
      lsp_trouble = true,
      vimwiki = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
  end,
}
