---@diagnostic disable: discard-returns
require("custom")
require("config")
require("lang")
require("plugins")

-- vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
-- vim.lsp.handlers["textDocument/codeAction"] = function(_, _, actions)
--   require("lsputil.codeAction").code_action_handler(nil, actions, nil, nil, nil)
-- end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.diagnostic.on_publish_diagnostics, {
--   -- delay update diagnostics
--   update_in_insert = true,
--   virtual_text = true,
--   signs = true,
-- })

vim.diagnostic.config({
  -- underline = false,
  virtual_text = true,
  update_in_insert = false,
  signs = true,
  severity_sort = true,
  -- float = {
  --   source = "always",  -- Or "if_many"
  -- },
})

-- vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
-- vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
-- vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
-- vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

vim.fn.sign_define("DiagnosticSignError", { numhl = "DiagnosticLineNrError" })
vim.fn.sign_define("DiagnosticSignWarn", { numhl = "DiagnosticLineNrWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { numhl = "DiagnosticLineNrInfo" })
vim.fn.sign_define("DiagnosticSignHint", { numhl = "DiagnosticLineNrHint" })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
})

vim.opt.list = true
vim.opt.listchars = {
  -- space = "⋅",
  -- space = "⋅",
  -- lead = "⋅",
  -- multispace = "+⋅",
  -- eol = "¬",
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
      filetype = { "neo-tree", "incline", "neo-tree-preview", "fidget", "noice" }, -- "notify",

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

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos" -- ,terminal
-- vim.o.laststatus = 3

-- vim.lsp.set_log_level("trace")

-- vim: foldmethod=marker
