return {
  "andymass/vim-matchup",
  enabled = true,
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "" }
    -- vim.g.matchup_text_obj_enabled = false
  end,
}
