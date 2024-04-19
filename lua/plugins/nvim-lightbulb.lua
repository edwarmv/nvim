return {
  "kosayoda/nvim-lightbulb",
  enabled = true,
  opts = {
    autocmd = { enabled = true, updatetime = 200, events = { "CursorHold" } },
    sign = {
      enabled = false,
    },
    float = {
      enabled = false,
    },
    virtual_text = {
      enabled = true,
      hl = "",
    },
  },
}
