return {
  "linrongbin16/gitlinker.nvim",
  cmd = "GitLink",
  opts = function()
    local routers = require("gitlinker.routers")
    return {
      router = {
        browse = {
          ["^gitlab%.ekupd%.com"] = routers.gitlab_browse,
        },
        blame = {
          ["^gitlab%.ekupd%.com"] = routers.gitlab_blame,
        },
      },
    }
  end,
  keys = {
    { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
    { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
  },
}
