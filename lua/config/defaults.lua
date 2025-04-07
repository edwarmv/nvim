local M = {}

M.border = "rounded"
M.lsp_debounce = 200
M.icons = {
  diagnostics = {
    error = "󰅚 ",
    warn = "󰀪 ",
    info = " ",
    hint = "󰌶 ",
  },
  git = {
    unstaged = "M",
    staged = "A",
    unmerged = "U",
    renamed = "R",
    untracked = "?",
    deleted = "D",
    ignored = "!",
  },
}

return M
