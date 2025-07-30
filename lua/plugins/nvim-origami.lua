return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  opts = {
    autoFold = {
      enabled = false,
    },
    foldKeymaps = {
      setup = false,
    },
  },
  -- recommended: disable vim's auto-folding
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
}
