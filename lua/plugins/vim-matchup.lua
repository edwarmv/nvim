return {
  "andymass/vim-matchup",
  lazy = false,
  init = function ()
    vim.g.matchup_matchparen_offscreen = { method = "" }
    -- vim.g.matchup_text_obj_enabled = false
  end
}
