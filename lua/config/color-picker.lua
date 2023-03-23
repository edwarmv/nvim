local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>cp", "<cmd>PickColor<cr>", opts)
-- vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

require("color-picker").setup({ -- for changing icons & mappings
  -- ["icons"] = { "ﱢ", "" },
  -- ["icons"] = { "ﮊ", "" },
  -- ["icons"] = { "", "ﰕ" },
  -- ["icons"] = { "", "" },
  -- ["icons"] = { "", "" },
  ["icons"] = { "ﱢ", "" },
  -- ["keymap"] = { -- mapping example:
  -- 	["U"] = "<Plug>Slider5Decrease",
  -- 	["O"] = "<Plug>Slider5Increase",
  -- },
})

-- vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
