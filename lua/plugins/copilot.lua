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
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<tab>",
        },
      },
    },
  },
}
