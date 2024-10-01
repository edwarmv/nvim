return {
  "andymass/vim-matchup",
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "" }
    vim.g.matchup_matchparen_deferred = true
  end,
}
