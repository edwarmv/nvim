vim.deprecate = function() end

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
vim.g.maplocalleader = "\\"

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
-- opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
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
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.mousemoveevent = true
opt.number = true -- Print line number
opt.pumblend = 0 -- Popup blend
opt.pumheight = 6 -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds", "winpos" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "auto" -- Always show the signcolumn, otherwise it would shift the text each time
opt.numberwidth = 1
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 500
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = true -- Disable line wrap
opt.breakindent = true
opt.showbreak = "…"
opt.linebreak = true
opt.colorcolumn = "80"
opt.smoothscroll = true

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

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.opt.foldcolumn = "auto"
vim.opt.viewoptions = { "folds", "cursor" }
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))]]
vim.opt.fillchars = {
  diff = "╱",
  eob = " ",
  fold = "·",
  foldopen = "▾",
  foldsep = " ",
  foldclose = "▸",
}
vim.opt.listchars = {
  -- space = "⋅",
  -- space = "⋅", -- "·"
  -- lead = "⋅",
  -- multispace = "+⋅",
  eol = "↲",
  -- tab = "→ ",
  tab = "  ",
  -- tab = "-->",
  -- trail = "⋅", -- ␣
  trail = " ", -- ␣
  extends = "…",
  precedes = "…",
}

-- =========================================================
-- Mappings
-- =========================================================
vim.keymap.set("n", "<m-H>", "<c-w>h")
vim.keymap.set("n", "<m-J>", "<c-w>j")
vim.keymap.set("n", "<m-K>", "<c-w>k")
vim.keymap.set("n", "<m-L>", "<c-w>l")
vim.keymap.set("i", "<c-b>", "<left>")
vim.keymap.set("i", "<c-f>", "<right>")
vim.keymap.set("i", "<c-n>", "<down>")
vim.keymap.set("i", "<c-p>", "<up>")
vim.keymap.set("c", "<c-a>", "<c-b>")
vim.keymap.set("c", "<c-l>", "<c-f>")
vim.keymap.set("c", "<c-b>", "<left>")
vim.keymap.set("c", "<c-f>", "<right>")
vim.keymap.set("n", "]t", "gt")
vim.keymap.set("n", "[t", "gT")
vim.keymap.set("n", "<leader>tn", "<cmd>$tabnew<cr>")
vim.keymap.set("n", "<leader>tm", ":tabmove")
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<cr>")
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>")
vim.api.nvim_create_autocmd({ "TabLeave" }, {
  command = "let g:lasttab = tabpagenr()",
})
vim.keymap.set("n", "<m-6>", ":exe 'tabn '.g:lasttab<cr>", { silent = true, desc = "Last Tab" })
vim.opt.tabline = [[%{%v:lua.require("config.tabline").draw()%}]]
vim.keymap.set("i", "<c-l>", "<c-f>")

vim.keymap.set("i", "<s-tab>", "<c-d>")

vim.diagnostic.config({
  -- underline = false,
  virtual_text = false,
  update_in_insert = false,
  severity_sort = true,
  virtual_lines = { only_current_line = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
      -- [vim.diagnostic.severity.ERROR] = "",
      -- [vim.diagnostic.severity.WARN] = "",
      -- [vim.diagnostic.severity.INFO] = "",
      -- [vim.diagnostic.severity.HINT] = "",
    },
  },
  -- float = {
  --   source = "always",  -- Or "if_many"
  -- },
})

local defaults = require("config.defaults")

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
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   group = augroup("json_conceal"),
--   pattern = { "json", "jsonc", "json5" },
--   callback = function()
--     vim.opt_local.conceallevel = 0
--   end,
-- })

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "NeogitCommitMessage", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_user_command("CloseAllFloatingWindows", function()
  if vim.fn.expand("%:t") == "[Command Line]" then
    return
  end

  if vim.api.nvim_get_option_value("filetype", { buf = 0 }) == "neo-tree" then
    return
  end

  local filter_rules = {
    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = { "neo-tree", "incline", "neo-tree-preview", "fidget", "noice", "NvimSeparator" }, -- "notify",

      -- if the buffer type is one of following, the window will be ignored
      buftype = { "terminal" },
    },
  }

  local window_ids = vim.api.nvim_list_wins()

  local filtered_windows = vim.tbl_filter(function(winid)
    local bufid = vim.api.nvim_win_get_buf(winid)

    for opt_key, opt_values in pairs(filter_rules.bo) do
      local actual_opt = vim.api.nvim_get_option_value(opt_key, { buf = bufid })

      local has_value = vim.tbl_contains(opt_values, actual_opt)

      if has_value then
        return false
      end
    end

    return true
  end, window_ids)

  for _, win in ipairs(filtered_windows) do
    if vim.api.nvim_win_is_valid(win) then
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= "" then
        vim.api.nvim_win_close(win, false)
      end
    end
  end
end, {})

vim.keymap.set("n", "<esc>", "<cmd>CloseAllFloatingWindows<cr>", { desc = "Quit all windows", remap = true })

local fn = vim.fn

function _G.qftf(info)
  local items
  local ret = {}
  -- The name of item in list is based on the directory of quickfix window.
  -- Change the directory for quickfix window make the name of item shorter.
  -- It's a good opportunity to change current directory in quickfixtextfunc :)
  --
  -- local alterBufnr = fn.bufname('#') -- alternative buffer is the buffer before enter qf window
  -- local root = getRootByAlterBufnr(alterBufnr)
  -- vim.cmd(('noa lcd %s'):format(fn.fnameescape(root)))
  --
  if info.quickfix == 1 then
    items = fn.getqflist({ id = info.id, items = 0 }).items
  else
    items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
  end
  local limit = 31
  local fnameFmt1, fnameFmt2 = "%-" .. limit .. "s", "…%." .. (limit - 1) .. "s"
  local validFmt = "%s │%5d:%-3d│%s %s"
  for i = info.start_idx, info.end_idx do
    local e = items[i]
    local fname = ""
    local str
    if e.valid == 1 then
      if e.bufnr > 0 then
        fname = fn.bufname(e.bufnr)
        if fname == "" then
          fname = "[No Name]"
        else
          fname = fname:gsub("^" .. vim.env.HOME, "~")
        end
        -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
        if #fname <= limit then
          fname = fnameFmt1:format(fname)
        else
          fname = fnameFmt2:format(fname:sub(1 - limit))
        end
      end
      local lnum = e.lnum > 99999 and -1 or e.lnum
      local col = e.col > 999 and -1 or e.col
      local qtype = e.type == "" and "" or " " .. e.type:sub(1, 1):upper()
      str = validFmt:format(fname, lnum, col, qtype, e.text)
    else
      str = e.text
    end
    table.insert(ret, str)
  end
  return ret
end

vim.o.qftf = "{info -> v:lua._G.qftf(info)}"

require("config")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = defaults.border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = defaults.border,
})
-- vim: foldmethod=marker
