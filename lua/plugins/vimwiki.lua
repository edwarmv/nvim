return {
  "vimwiki/vimwiki",
  event = "VeryLazy",
  enabled = true,
  init = function()
    vim.g.vimwiki_auto_chdir = 1
  end,
}
