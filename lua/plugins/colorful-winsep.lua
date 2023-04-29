return {
  "nvim-zh/colorful-winsep.nvim",
  config = true,
  opts = {
    highlight = {
      bg = "#3c3836",
      fg = "#d4be98",
    },
    symbols = { "─", "│", "┌", "┐", "└", "┘" },
  },
  event = { "WinNew" },
}
