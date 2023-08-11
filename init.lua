-- =========================================================
-- vim-settings
-- =========================================================
-- vim.opt.python3_host_prog = vim.fn.expand("~") .. "/.asdf/shims/python3"
vim.loader.enable()
vim.opt.shortmess:append({ I = true, A = false })
vim.opt.jumpoptions = "view"
vim.opt.splitkeep = "screen"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = "auto:1"
vim.opt.numberwidth = 1
vim.opt.number = false
vim.opt.wrap = false
-- " set linebreak
-- " set showbreak=…
-- " set breakindent " indent wrap
vim.opt.display = "msgsep"
vim.opt.timeoutlen = 500
-- " https://github.com/sindrets/diffview.nvim/issues/35
vim.opt.fillchars:append({ diff = "╱", eob = " ", fold = " ", foldopen = "⯆", foldsep = "│", foldclose = "⯈" })
-- vim.opt.indentkeys:remove({ "o", "O" })
vim.o.foldcolumn = "auto:1" -- '0' is not bad
-- vim.o.foldenable = true
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))]]

-- =========================================================
-- Mappings
-- =========================================================

-- vim.keymap.set("n", "<c-w>t", "<cmd>tabe %<cr>")

-- " function FocusFloatingWindow()
-- "   let window_count = winnr('$')
-- "   execute window_count . "wincmd w"
-- " endfunction

-- vim.keymap.set("n", "<leader><leader>f", function()
--   local window_count = vim.fn.winnr("$")
--   vim.cmd(window_count .. "wincmd w")
-- end, { desc = "Focus Floating Window" })

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

-- au TabLeave * let g:lasttab = tabpagenr()
vim.keymap.set("n", "<m-6>", ":exe 'tabn '.g:lasttab<cr>", { silent = true, desc = "Last Tab" })

vim.opt.tabline = [[%{%v:lua.require("config.tabline").draw()%}]]
--
-- " nmap <m-s> <cmd>w<cr>
-- " vmap <m-s> <cmd>w<cr>
-- " imap <m-s> <cmd>w<cr>
-- "
-- " nmap <m-S> <cmd>wa<cr>
-- " vmap <m-S> <cmd>wa<cr>
-- " imap <m-S> <cmd>wa<cr>
-- "
-- " nmap <m-w> <cmd>bd<cr>
-- " vmap <m-w> <cmd>bd<cr>
-- " imap <m-w> <cmd>bd<cr>
-- "
-- " nmap <m-W> <cmd>bufdo bd<cr>
-- " vmap <m-W> <cmd>bufdo bd<cr>
-- " imap <m-W> <cmd>bufdo bd<cr>
-- "{{{
-- " nnoremap <silent> zh :call HorizontalScrollMode('h')<CR>
-- " nnoremap <silent> zl :call HorizontalScrollMode('l')<CR>
-- " nnoremap <silent> zH :call HorizontalScrollMode('H')<CR>
-- " nnoremap <silent> zL :call HorizontalScrollMode('L')<CR>
-- "
-- " function! HorizontalScrollMode( call_char )
-- "     if &wrap
-- "         return
-- "     endif
-- "
-- "     execute 'IndentBlanklineDisable'
-- "
-- "     echohl Title
-- "     let typed_char = a:call_char
-- "     while index( [ 'h', 'l', 'H', 'L' ], typed_char ) != -1
-- "         execute 'normal! z'.typed_char
-- "         redraws
-- "         echon '-- Horizontal scrolling mode (h/l/H/L)'
-- "         let typed_char = nr2char(getchar())
-- "     endwhile
-- "
-- "     execute 'IndentBlanklineEnable'
-- "
-- "     echohl None | echo '' | redraws
-- " endfunction
-- "}}}
--
-- " autocmd VimEnter * :let @/ = ""
--
-- " search under the cursor and keep their position
-- " https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
-- " nmap <silent> <leader>hl :let @/=expand('<cword>') <bar> set hls <cr>
-- " nmap <silent> <leader>hn <cmd>noh<cr>
-- " nnoremap <leader><leader>h <cmd>nohl<cr>

-- *************
-- for lsp
-- *************
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.hidden = true
vim.opt.shortmess:append({ c = true })
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.encoding = "utf-8"
vim.opt.updatetime = 300
vim.opt.pumheight = 6
vim.opt.wildoptions = { "tagfile" }
vim.opt.conceallevel = 3

-- *************
-- Spaces & Tabs
-- *************
vim.opt.tabstop = 8 -- number of visual spaces per TAB
vim.opt.softtabstop = -1 -- number of spaces in tab when editing - previous value 0
vim.opt.shiftwidth = 2 -- number of spaces to use for autoindent
vim.opt.expandtab = true -- tabs are space
vim.opt.copyindent = true
-- set smarttab
-- " set smartindent
-- set autoindent
-- set cinkeys=
-- filetype indent on
vim.opt.viewoptions = { "folds" }
-- " no autocomments
-- " set indentkeys=!^F
-- " set formatoptions=tcqj
-- " autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o indentkeys=!^F
--
-- autocmd BufEnter * setlocal formatoptions=cqjr/ indentkeys=!^F
-- autocmd TermOpen * setlocal signcolumn=no nocursorcolumn nocursorline nonumber
-- autocmd CmdwinEnter * setlocal nonumber signcolumn=no
--
-- " disable because tree-sitter errors
-- " nnoremap = <nop>
-- " vnoremap = <nop>
-- " vnoremap gq <nop>
vim.keymap.set("i", "<c-l>", "<c-f>")
-- " vnoremap p P
-- " vnoremap P p
-- " nmap <F1> <nop>
-- " imap <F1> <nop>
--
-- " =========================================================
-- " colors cheme config
-- " =========================================================
-- syntax on
-- set termguicolors
vim.opt.termguicolors = true
-- " autocmd BufRead * syn sync fromstart
-- " source ~/.config/nvim/colorscheme_config/tokyonight.vim
-- " source ~/.config/nvim/colorscheme_config/gruvbox-material.vim
-- " source ~/.config/nvim/colorscheme_config/edge.vim
--
-- au BufRead,BufNewFile Podfile set filetype=ruby
--
--       " \ 'hexokinase.vim',
-- let s:core_conf_files = [
--       \ 'gruvbox-material.vim',
--       \ ]
--     " \ 'vim-markdown.vim',
--     " \ 'winresizer.vim',
--     " \ 'vim-visual-multi.vim',
--     " \ 'emmet-vim.vim',
--     " \ 'vim-netrw.vim',
--     " \ 'matchup.vim',
--     " \ 'zoom.vim',
--     " \ 'fzf.vim',
--
-- for s:fname in s:core_conf_files
--   execute printf('source %s/vim/%s', stdpath('config'), s:fname)
-- endfor

vim.diagnostic.config({
  -- underline = false,
  virtual_text = true,
  update_in_insert = true,
  signs = true,
  severity_sort = true,
  virtual_lines = true,
  -- float = {
  --   source = "always",  -- Or "if_many"
  -- },
})

vim.fn.sign_define("DiagnosticSignError", { numhl = "DiagnosticLineNrError" })
vim.fn.sign_define("DiagnosticSignWarn", { numhl = "DiagnosticLineNrWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { numhl = "DiagnosticLineNrInfo" })
vim.fn.sign_define("DiagnosticSignHint", { numhl = "DiagnosticLineNrHint" })

local defaults = require("config.defaults")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = defaults.border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = defaults.border,
})

vim.opt.list = true
vim.opt.listchars = {
  -- space = "⋅",
  -- space = "⋅", -- "·"
  -- lead = "⋅",
  -- multispace = "+⋅",
  eol = "↴",
  -- tab = "→ ",
  tab = "  ",
  -- tab = "-->",
  -- trail = "⋅", -- ␣
  trail = " ", -- ␣
  -- extends = "…",
  -- precedes = "…",
}

vim.keymap.set("n", "<esc>", function()
  if vim.fn.expand("%:t") == "[Command Line]" then
    return
  end

  if vim.api.nvim_buf_get_option(0, "filetype") == "neo-tree" then
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
      local actual_opt = vim.api.nvim_buf_get_option(bufid, opt_key)

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
end)

-- REF: https://github.com/neovim/nvim-lspconfig/issues/1659
-- vim.api.nvim_create_autocmd("BufDelete", {
--   group = vim.api.nvim_create_augroup("BufDeleteLspBufDetach", {}),
--   callback = function(info)
--     local bufnr = info.buf
--     local clients = vim.lsp.buf_get_clients(bufnr)
--     for client_id, _ in pairs(clients) do
--       vim.lsp.buf_detach_client(bufnr, client_id)
--     end
--   end,
-- })
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function()
--     vim.api.nvim_create_autocmd({ "BufDelete" }, {
--       buffer = vim.api.nvim_get_current_buf(),
--       callback = function(opts)
--         local bufnr = opts.buf
--         local clients = vim.lsp.buf_get_clients(bufnr)
--         for client_id, _ in pairs(clients) do
--           vim.lsp.buf_detach_client(bufnr, client_id)
--         end
--       end,
--     })
--   end,
-- })

vim.opt.sessionoptions = "blank,buffers,curdir,help,tabpages,globals,winsize,winpos" -- ,terminal
vim.opt.laststatus = 3

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

-- local cmdheight

-- vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
--   callback = function()
--     cmdheight = vim.api.nvim_get_option_value('cmdheight', {});
--     vim.opt.cmdheight = 1
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
--   callback = function()
--     vim.opt.cmdheight = cmdheight
--   end,
-- })

-- vim.lsp.set_log_level("trace")

require("config")

-- vim: foldmethod=marker
