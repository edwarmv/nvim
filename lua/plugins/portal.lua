return {
  "cbochs/portal.nvim",
  dependencies = {
    "cbochs/grapple.nvim",
    "ThePrimeagen/harpoon",
  },
  keys = {
    { "<leader>o", "<cmd>Portal jumplist backward<cr>" },
    { "<leader>i", "<cmd>Portal jumplist forward<cr>" },
  },
}
