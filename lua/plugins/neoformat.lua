return {
  "sbdchd/neoformat",
  init = function()
    vim.g.neoformat_enabled_python = { "prettier", "stylua", "black" }
  end,
  keys = {
    {
      "<leader>F",
      "<cmd>Neoformat<cr>",
      mode = { "n", "v" },
      desc = "Neoformat",
    },
  },
}
