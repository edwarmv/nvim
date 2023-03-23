require("neoclip").setup({
  enable_persistent_history = true,
  continuous_sync = false,
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
  preview = true,
  default_register = '"',
  default_register_macros = "q",
  enable_macro_history = true,
  on_paste = {
    set_reg = false,
  },
  on_replay = {
    set_reg = false,
  },
  keys = {
    telescope = {
      i = {
        select = "<cr>",
        paste = "<c-p>",
        paste_behind = "<c-k>",
        replay = "<c-q>", -- replay a macro
        delete = "<c-d>", -- delete an entry
        custom = {},
      },
      n = {
        select = "<cr>",
        paste = "p",
        --- It is possible to map to more than one key.
        -- paste = { 'p', '<c-p>' },
        paste_behind = "P",
        replay = "q",
        delete = "d",
        custom = {},
      },
    },
    fzf = {
      select = "default",
      paste = "alt-p",
      paste_behind = "alt-P",
      custom = {},
    },
  },
})

-- vim.keymap.set("n", "<space>fy", function()
--   require("neoclip.fzf")()
-- end, { desc = "Yank history" })

vim.keymap.set("n", "<space>y", "<cmd>Telescope neoclip unnamed<cr>")
vim.keymap.set("n", "<leader>np", require("neoclip").db_pull, { desc = "pull yank history" })
vim.keymap.set("n", "<leader>nP", require("neoclip").db_push, { desc = "push yank history" })
