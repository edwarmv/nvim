vim.g.lightspeed_no_default_keymaps = true
require("lightspeed").setup({
  substitute_chars = { ["\r"] = "¬", [" "] = "⋅" },
  jump_to_unique_chars = false,
})

local opts = { noremap = false, silent = true, expr = false }

vim.keymap.set("n", "s", "<Plug>Lightspeed_s", opts)
vim.keymap.set("v", "s", "<Plug>Lightspeed_s", opts)

vim.keymap.set("n", "S", "<Plug>Lightspeed_S", opts)
vim.keymap.set("v", "Z", "<Plug>Lightspeed_S", opts)

vim.keymap.set("o", "z", "<Plug>Lightspeed_s", opts)
vim.keymap.set("o", "Z", "<Plug>Lightspeed_S", opts)

vim.keymap.set("o", "x", "<Plug>Lightspeed_x", opts)
vim.keymap.set("o", "X", "<Plug>Lightspeed_X", opts)

vim.keymap.set("", "f", "<Plug>Lightspeed_f", opts)
vim.keymap.set("", "F", "<Plug>Lightspeed_F", opts)

vim.keymap.set("", "t", "<Plug>Lightspeed_t", opts)
vim.keymap.set("", "T", "<Plug>Lightspeed_T", opts)

-- vim.cmd([[hi LightspeedLabel cterm=bold,underline ctermfg=142 gui=bold,underline guifg=#a9b665]])
-- vim.cmd([[hi LightspeedLabelOverlapped cterm=underline ctermfg=142 gui=underline guifg=#a9b665]])

-- vim.cmd([[hi LightspeedLabelDistant cterm=bold,underline ctermfg=109 gui=bold,underline guifg=#7daea3]])
-- vim.cmd([[hi LightspeedLabelDistantOverlapped cterm=underline ctermfg=109 gui=underline guifg=#7daea3]])

-- vim.cmd([[hi LightspeedShortcut cterm=bold,underline ctermfg=236 ctermbg=142 gui=bold,underline guifg=#32302f guibg=#a9b665]])
-- vim.cmd([[hi LightspeedShortcutOverlapped cterm=bold ctermfg=236 ctermbg=142 gui=bold guifg=#32302f guibg=#a9b665]])

-- vim.cmd([[hi LightspeedMaskedChar cterm=bold ctermfg=175 gui=bold guifg=#d3869b]])

-- vim.cmd([[hi LightspeedGreyWash ctermfg=none guifg=none]])

-- vim.cmd([[hi LightspeedUnlabeledMatch cterm=bold ctermfg=223 gui=bold guifg=#d4be98]])

-- vim.cmd([[hi LightspeedOneCharMatch cterm=bold ctermfg=236 ctermbg=142 gui=bold guifg=#32302f guibg=#a9b665]])

-- vim.cmd([[hi LightspeedPendingOpArea ctermfg=236 ctermbg=142 guifg=#32302f guibg=#a9b665]])

-- vim.cmd([[hi LightspeedCursor guifg=#282828 guibg=#a89984]])

vim.g.lightspeed_last_motion = ""
vim.cmd([[
    augroup lightspeed_last_motion
    autocmd!
    autocmd User LightspeedSxEnter let g:lightspeed_last_motion = 'sx'
    autocmd User LightspeedFtEnter let g:lightspeed_last_motion = 'ft'
    augroup end
    ]])
vim.keymap.set(
  "",
  ";",
  "g:lightspeed_last_motion == 'sx' ? '<Plug>Lightspeed_;_sx' : '<Plug>Lightspeed_;_ft'",
  { remap = true, silent = true, expr = true, replace_keycodes = false }
)
vim.keymap.set(
  "",
  ",",
  "g:lightspeed_last_motion == 'sx' ? '<Plug>Lightspeed_,_sx' : '<Plug>Lightspeed_,_ft'",
  { remap = true, silent = true, expr = true, replace_keycodes = false }
)

-- vim.api.nvim_create_autocmd("User", {
--   pattern = { "LightspeedEnter" },
--   callback = function()
--     require("incline").disable()
--   end,
-- })
-- vim.api.nvim_create_autocmd("User", {
--   pattern = { "LightspeedLeave" },
--   callback = function()
--     require("incline").enable()
--   end,
-- })
