vim.deprecate = function() end
vim.notify_once = function() end
-- =========================================================
-- vim-settings
-- =========================================================
vim.g.neovide_padding_top = 28
vim.g.neovide_padding_bottom = 28
vim.g.neovide_padding_right = 28
vim.g.neovide_padding_left = 28
vim.g.neovide_floating_shadow = false
-- vim.g.neovide_transparency = 0.8
-- vim.g.neovide_window_blurred = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_refresh_rate = 120
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_no_idle = false
vim.g.neovide_input_macos_option_key_is_meta = "both"

-- =========================================================
-- vim-settings
-- =========================================================
-- This file is automatically loaded by plugins.core
vim.g.mapleader = "\\"
vim.g.maplocalleader = ","

-- Enable LazyVim auto format
vim.g.autoformat = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt

opt.autowrite = false -- Enable auto write
-- opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = false -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.cursorcolumn = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = false -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.mousemoveevent = true
opt.number = true -- Print line number
opt.pumblend = 0 -- Popup blend
opt.pumheight = 6 -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.signcolumn = "auto" -- Always show the signcolumn, otherwise it would shift the text each time
opt.numberwidth = 1
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.spelloptions:append("noplainbuffer")
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 8 -- Number of spaces tabs count for
opt.softtabstop = -1
opt.shiftwidth = 2 -- Size of an indent
opt.termguicolors = true -- True color support
opt.timeoutlen = 500
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 300 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = true -- Disable line wrap
opt.breakindent = true
opt.showbreak = "" -- ↳
opt.colorcolumn = "80"
opt.linebreak = false

-- vim.api.nvim_create_autocmd({ "BufLeave" }, {
--   pattern = "{}",
--   callback = function()
--     if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
--       vim.bo.buftype = "nofile"
--       vim.bo.bufhidden = "wipe"
--     end
--   end,
-- })

vim.keymap.set({ "n", "v" }, "k", function()
  return vim.v.count > 0 and "k" or "gk"
end, { expr = true, desc = "k or gk" })
vim.keymap.set({ "n", "v" }, "j", function()
  return vim.v.count > 0 and "j" or "gj"
end, { expr = true, desc = "j or gj" })

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))]]
vim.opt.fillchars = {
  diff = "╱",
  eob = " ",
  fold = " ",
  foldopen = "▾",
  foldsep = " ",
  foldclose = "▸",
}
vim.opt.listchars = {
  -- space = "⋅",
  -- space = "⋅", -- "·"
  -- lead = "⋅",
  -- multispace = "+⋅",
  -- eol = "↲",
  -- tab = "→ ",
  tab = "  ",
  -- tab = "-->",
  -- trail = "⋅", -- ␣
  trail = " ", -- ␣
  -- extends = "…",
  -- precedes = "…",
}

-- =========================================================
-- Mappings
-- =========================================================
vim.keymap.set("i", "<c-b>", "<left>")
vim.keymap.set("i", "<c-f>", "<right>")
vim.keymap.set("i", "<c-n>", "<down>")
vim.keymap.set("i", "<c-p>", "<up>")
vim.keymap.set("c", "<c-a>", "<c-b>")
vim.keymap.set("c", "<c-l>", "<c-f>")
vim.keymap.set("c", "<c-b>", "<left>")
vim.keymap.set("c", "<c-f>", "<right>")
vim.keymap.set("n", "<c-w><c-l>", "<c-l><cmd>nohl<cr>")
vim.keymap.set("n", "<leader>tn", "<cmd>$tabnew<cr>")
vim.keymap.set("n", "<leader>tm", function()
  vim.ui.input({ prompt = "Enter The Tab Index: " }, function(tab_index)
    vim.cmd("tabmove" .. tab_index)
  end)
end)
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<cr>")
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>")
vim.api.nvim_create_autocmd({ "TabLeave" }, {
  command = "let g:lasttab = tabpagenr()",
})
vim.keymap.set("n", "<m-6>", ":exe 'tabn '.g:lasttab<cr>", { silent = true, desc = "Last Tab" })
vim.opt.tabline = [[%{%v:lua.require("config.tabline").draw()%}]]
vim.keymap.set("i", "<c-l>", "<c-f>")
vim.keymap.set("i", "<s-tab>", "<c-d>")
vim.keymap.set("n", "<c-w>z", ":resize | vertical resize<CR>")
vim.keymap.set({ "n", "x" }, "gy", '"+y')
vim.keymap.set({ "n", "x" }, "gp", '"+p')

local defaults = require("config.defaults")
local icons = defaults.icons

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
    },
  },
  float = {
    border = defaults.border,
  },
})

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "harpoon",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "NeogitCommitMessage", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

require("config")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method("textDocument/foldingRange") then
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})
