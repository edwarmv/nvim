return {
  "vimwiki/vimwiki",
  event = "VeryLazy",
  enabled = false,
  init = function()
    vim.g.vimwiki_auto_chdir = 1
  end,
}
