vim.deprecate = function() end
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.winborder = "rounded"

vim.o.completeopt = "menu,menuone,noselect"
vim.o.confirm = true -- Confirm to save changes before exiting modified buffer
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.cursorcolumn = true -- Enable highlighting of the current line
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.formatoptions = "jcroqlnt" -- tcqj
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.ignorecase = true -- Ignore case
vim.o.inccommand = "nosplit" -- preview incremental substitute
vim.o.laststatus = 3 -- global statusline
vim.o.cmdheight = 0
vim.o.list = true -- Show some invisible characters (tabs...
vim.o.number = true -- Print line number
vim.o.pumblend = 0 -- Popup blend
vim.o.pumheight = 6 -- Maximum number of entries in a popup
vim.o.relativenumber = false -- Relative line numbers
vim.o.shiftround = true -- Round indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.o.showmode = false -- Dont show mode since we have a statusline
vim.o.signcolumn = "yes:1" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.numberwidth = 1
vim.o.smartcase = true -- Don't ignore case with capitals
vim.opt.spelllang = { "en" }
vim.opt.spelloptions:append("noplainbuffer")
vim.opt.sessionoptions:remove({ "blank", "folds", "help" })
vim.opt.sessionoptions:append({ "winpos" })
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitkeep = "screen"
vim.o.splitright = true -- Put new windows right of current
vim.o.tabstop = 2 -- Number of spaces tabs count for
vim.o.shiftwidth = 2 -- Size of an indent
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 300 -- Save swap file and trigger CursorHold
vim.o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.o.wildmode = "longest:full,full" -- Command-line completion mode
vim.o.winminwidth = 5 -- Minimum window width
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.colorcolumn = "80"
vim.o.breakindent = true
vim.o.showbreak = "↪"
vim.o.termguicolors = true

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
vim.opt.foldtext = ""
vim.opt.fillchars = {
  foldopen = "▾",
  foldclose = "▸",
  diff = "╱",
}
vim.opt.listchars = {
  -- multispace = "⋅",
  trail = "⋅",
  tab = "-->",
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
vim.keymap.set("n", "<c-w><c-l>", "<c-l><cmd>nohl<cr><cmd>lua Snacks.notifier.hide()<cr>")
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
vim.keymap.set("n", "<leader>tt", ":exe 'tabn '.g:lasttab<cr>", { silent = true, desc = "Last Tab" })
-- vim.opt.tabline = [[%{%v:lua.require("config.tabline").draw()%}]]
vim.keymap.set("i", "<c-l>", "<c-f>")
vim.keymap.set("i", "<s-tab>", "<c-d>")
vim.keymap.set("n", "<c-w>z", ":resize | vertical resize<CR>")
vim.keymap.set({ "n", "x" }, "gy", '"+y')
vim.keymap.set({ "n", "x" }, "gp", '"+p')

local defaults = require("config.defaults")
local icons = defaults.icons

vim.diagnostic.config({
  virtual_text = {
    current_line = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
    },
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
    if client ~= nil and client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})

vim.cmd.colorscheme("kanagawa")
