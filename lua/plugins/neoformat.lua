return {
  "sbdchd/neoformat",
  enabled = false,
  init = function()
    vim.g.neoformat_enabled_python = { "prettier", "stylua", "black" }
  end,
  keys = {
    {
      "<leader>f",
      ":Neoformat<cr>",
      mode = { "n", "v" },
      desc = "Neoformat",
    },
  },
}
