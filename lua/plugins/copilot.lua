return {
  {
    "github/copilot.vim",
    enabled = false,
    -- init = function()
    --   vim.g.copilot_enabled = false
    -- end,
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = nil,
        },
      },
    },
  },
}
