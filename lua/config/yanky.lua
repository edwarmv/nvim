require("telescope").load_extension("yank_history")
require("yanky").setup({
  ring = {
    history_length = 10,
    storage = "shada",
    sync_with_numbered_registers = true,
    cancel_event = "update",
  },
  picker = {
    select = {
      action = nil, -- nil to use default put action
    },
    telescope = {
      mappings = nil, -- nil to use default mappings
    },
  },
  system_clipboard = {
    sync_with_ring = true,
  },
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 250,
  },
  preserve_cursor_position = {
    enabled = true,
  },
})

-- vim.keymap.set("n", "<space>y", "<cmd>YankyRingHistory<cr>", {})
vim.keymap.set("n", "<space>y", "<cmd>Telescope yank_history<cr>")

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", {})
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", {})
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", {})
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", {})

vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)", {})
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)", {})
