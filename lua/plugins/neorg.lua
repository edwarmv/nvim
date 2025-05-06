return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
    },
  },
  keys = {
    { "<leader>n", "<cmd>Neorg<cr>", desc = "Neorg - Open" },
    { "<leader>N", "<cmd>Neorg return<cr>", desc = "Neorg - Return" },
  },
}
