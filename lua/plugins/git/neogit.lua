return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    -- "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  enabled = true,
  opts = {
    disable_signs = true,
    signs = {
      hunk = { "▸", "▾" },
      item = { "▸", "▾" },
      section = { "▸", "▾" },
    },
    graph_style = "unicode",
    kind = "replace",
    commit_editor = {
      kind = "replace",
    },
    commit_select_view = {
      kind = "replace",
    },
    log_view = {
      kind = "tab",
    },
    reflog_view = {
      kind = "replace",
    },
  },
  keys = {
    {
      "<leader>gn",
      function()
        require("neogit").open()
      end,
      desc = "[Neogit] - Open",
    },
    {
      "<leader>gN",
      function()
        require("neogit").open({ cwd = "%:p:h" })
      end,
      desc = "[Neogit] - Open Relative",
    },
  },
}
