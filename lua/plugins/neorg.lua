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
    { "<space>n", "<cmd>Neorg<cr>", desc = "Neorg - Open" },
    { "<space>N", "<cmd>Neorg return<cr>", desc = "Neorg - Return" },
  },
}
