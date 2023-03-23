require("gomove").setup({
  -- whether or not to map default key bindings, (true/false)
  map_defaults = false,
  -- whether or not to reindent lines moved vertically (true/false)
  reindent = true,
  -- whether or not to undojoin same direction moves (true/false)
  undojoin = true,
  -- whether to not to move past end column when moving blocks horizontally, (true/false)
  move_past_end_col = false,
})

local map = vim.keymap.set

map("n", "<m-h>", "<Plug>GoNSMLeft")
map("n", "<m-j>", "<Plug>GoNSMDown")
map("n", "<m-k>", "<Plug>GoNSMUp")
map("n", "<m-l>", "<Plug>GoNSMRight")

map("x", "<m-h>", "<Plug>GoVSMLeft")
map("x", "<m-j>", "<Plug>GoVSMDown")
map("x", "<m-k>", "<Plug>GoVSMUp")
map("x", "<m-l>", "<Plug>GoVSMRight")

-- map("n", "<m-h>", "<Plug>GoNSDLeft")
-- map("n", "<m-j>", "<Plug>GoNSDDown")
-- map("n", "<m-k>", "<Plug>GoNSDUp")
-- map("n", "<m-l>", "<Plug>GoNSDRight")

-- map("x", "<m-h>", "<Plug>GoVSDLeft")
-- map("x", "<m-j>", "<Plug>GoVSDDown")
-- map("x", "<m-k>", "<Plug>GoVSDUp")
-- map("x", "<m-l>", "<Plug>GoVSDRight")
