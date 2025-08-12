return {
  "sindrets/diffview.nvim",
  opts = {},
  cmd = { "DiffviewOpen" },
  keys = {
    { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Diffview - Open" },
    {
      "<leader>gdO",
      function()
        local diffview = require("diffview")
        local all = vim.fn.systemlist({ "git", "rev-parse", "--symbolic", "--branches", "--tags", "--remotes" })
        local original_base = "Original base"
        table.insert(all, 1, original_base)
        vim.ui.select(all, {
          prompt = "Select branch",
        }, function(choice)
          if choice == nil then
            return
          elseif choice == original_base then
            choice = nil
          end
          diffview.open({ choice })
        end)
      end,
      desc = "Diffview - Open",
    },
    { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Diffview - Open" },
    { "<leader>gdq", "<cmd>DiffviewClose<cr>", desc = "Diffview - Close" },
    { "<leader>gdH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview - File History" },
    { "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview - File History Current File" },
  },
}
