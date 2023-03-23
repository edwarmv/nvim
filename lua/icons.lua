local M = {}

M.git = {
  unstaged = "M",
  staged = "A",
  unmerged = "U",
  renamed = "R",
  untracked = "?",
  deleted = "D",
  ignored = "!",
}

-- M.diagnostic = {
--   error = "E",
--   warn = "W",
--   info = "I",
--   hint = "H",
-- }

M.diagnostic = {
  error = " ",
  warn = " ",
  info = " ",
  hint = " ",
}

return M
