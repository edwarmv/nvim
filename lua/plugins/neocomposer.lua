return {
  "ecthelionvi/NeoComposer.nvim",
  enabled = false,
  dependencies = { "kkharji/sqlite.lua" },
  opts = {
    queue_most_recent = true,
    colors = {
      bg = "#1f2335",
      fg = "#ff9e64",
      red = "#f7768e",
      blue = "#7aa2f7",
      green = "#9ece6a",
    },
    -- colors = {
    --   bg = "#3c3836",
    --   fg = "#e78a4e",
    --   red = "#ea6962",
    --   blue = "#7daea3",
    --   green = "#a9b665",
    -- },
    keymaps = {
      cycle_next = "]q",
      cycle_prev = "[q",
    },
  },
}
