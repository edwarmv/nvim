return {
  "akinsho/git-conflict.nvim",
  enabled = false,
  lazy = false,
  opts = {
    default_mappings = true, -- disable buffer local mapping created by this plugin
    disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
    highlights = { -- They must have background color, otherwise the default color will be used
      current = "DiffAdd",
      incoming = "DiffChange",
      ancestor = "Visual",
    },
  },
}
