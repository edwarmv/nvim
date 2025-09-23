return {
  "kosayoda/nvim-lightbulb",
  enabled = true,
  opts = {
    priority = 2049,
    autocmd = { enabled = true },
    code_lenses = true,
    sign = {
      enabled = false,
    },
    float = {
      enabled = false,
      win_opts = {
        border = "none",
        winblend = 100,
      },
    },
    virtual_text = {
      enabled = true,
    },
  },
}
