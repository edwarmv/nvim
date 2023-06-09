return {
  "kevinhwang91/nvim-bqf",
  dependencies = { "junegunn/fzf" },
  ft = "qf",
  opts = {
    preview = {
      -- border_chars = { "│", "│", "─", "─", "┌", "┐", "└", "┘", "█" },
      border_chars = { "│", "│", "─", "─", "╭", "╮", "╰", "╯", "█" },
      winblend = 0,
    },
  },
}
