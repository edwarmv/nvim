return {
  "NTBBloodbath/rest.nvim",
  enabled = true,
  ft = "http",
  keys = {
    {
      "<localleader>rr",
      "<cmd>Rest run<cr>",
      desc = "Run request under the cursor",
    },
    {
      "<localleader>rl",
      "<cmd>Rest run last<cr>",
      desc = "Re-run latest request",
    },
  },
}
