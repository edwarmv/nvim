return {
  "akinsho/git-conflict.nvim",
  version = "*",
  opts = {
    default_mappings = false, -- disable buffer local mapping created by this plugin
    disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
    highlights = { -- They must have background color, otherwise the default color will be used
      current = "DiffAdd",
      incoming = "DiffChange",
      ancestor = "Visual",
    },
  },
  keys = {
    { "co", "<Plug>(git-conflict-ours)", desc = "Git Conflict - Choose Ours" },
    { "ct", "<Plug>(git-conflict-theirs)", desc = "Git Conflict - Choose Theirs" },
    { "cb", "<Plug>(git-conflict-both)", desc = "Git Conflict - Choose Both" },
    { "c0", "<Plug>(git-conflict-none)", desc = "Git Conflict - Choose None" },
    { "]x", "<Plug>(git-conflict-prev-conflict)", desc = "Git Conflict - Prev" },
    { "[x", "<Plug>(git-conflict-next-conflict)", desc = "Git Conflict - Next" },
  },
}
