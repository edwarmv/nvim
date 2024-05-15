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
    disable_signs = false,
    signs = {
      -- { CLOSED, OPENED }
      hunk = { "▸", "▾" },
      item = { "▸", "▾" },
      section = { "▸", "▾" },
    },
    auto_show_console = false,
    graph_style = "unicode",
    kind = "floating",
    commit_editor = {
      kind = "floating",
    },
    commit_select_view = {
      kind = "floating",
    },
    commit_view = {
      kind = "floating",
    },
    log_view = {
      kind = "floating",
    },
    rebase_editor = {
      kind = "floating",
    },
    reflog_view = {
      kind = "floating",
    },
    merge_editor = {
      kind = "floating",
    },
    tag_editor = {
      kind = "floating",
    },
    preview_buffer = {
      kind = "floating",
    },
    popup = {
      kind = "floating",
    },
  },
  keys = {
    {
      "<leader>n",
      function()
        require("neogit").open()
      end,
      desc = "[Neogit] - Open",
    },
    {
      "<leader>N",
      function()
        require("neogit").open({ cwd = "%:p:h" })
      end,
      desc = "[Neogit] - Open Relative",
    },
  },
}
