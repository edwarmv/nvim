return {
  "NeogitOrg/neogit",
  branch = "nightly",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  opts = {
    signs = {
      -- { CLOSED, OPENED }
      hunk = { "", "" },
      item = { "", "" },
      section = { "", "" },
    },
  },
  keys = {
    { "<leader>n", "<cmd>Neogit<cr>", desc = "[Neogit] - Open" },
    { "<leader>N", "<cmd>Neogit cwd=%:p:h<cr>", desc = "[Neogit] - Open Relative" },
  },
}
