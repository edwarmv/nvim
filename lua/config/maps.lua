local M = {}

local function lspRename()
  local clients = vim.lsp.get_clients({
    bufnr = 0,
    method = "textDocument/rename",
  })
  vim.ui.select(clients, {
    format_item = function(client)
      return client.name
    end,
  }, function(chosenClient)
    if chosenClient ~= nil then
      vim.lsp.buf.rename(nil, {
        filter = function(client)
          return client.name == chosenClient.name
        end,
      })
    end
  end)
end

---@private
---@param bufnr integer
---@param mode "v"|"V"
---@return table {start={row,col}, end={row,col}} using (1, 0) indexing
local function range_from_selection(bufnr, mode)
  -- TODO: Use `vim.region()` instead https://github.com/neovim/neovim/pull/13896

  -- [bufnum, lnum, col, off]; both row and column 1-indexed
  local start = vim.fn.getpos("v")
  local end_ = vim.fn.getpos(".")
  local start_row = start[2]
  local start_col = start[3]
  local end_row = end_[2]
  local end_col = end_[3]

  -- A user can start visual selection at the end and move backwards
  -- Normalize the range to start < end
  if start_row == end_row and end_col < start_col then
    end_col, start_col = start_col, end_col
  elseif end_row < start_row then
    start_row, end_row = end_row, start_row
    start_col, end_col = end_col, start_col
  end
  if mode == "V" then
    start_col = 1
    local lines = vim.api.nvim_buf_get_lines(bufnr, end_row - 1, end_row, true)
    end_col = #lines[1]
  end
  return {
    ["start"] = { start_row, start_col - 1 },
    ["end"] = { end_row, end_col - 1 },
  }
end

local function lspFormat()
  local mode = vim.api.nvim_get_mode().mode
  local range
  if mode == "v" or mode == "V" then
    range = range_from_selection(0, mode)
  end

  local method = range and "textDocument/rangeFormatting" or "textDocument/formatting"

  local clients = vim.lsp.get_active_clients({
    bufnr = 0,
  })

  clients = vim.tbl_filter(function(client)
    return client.supports_method(method)
  end, clients)

  vim.ui.select(clients, {
    format_item = function(client)
      return client.name
    end,
  }, function(chosenClient)
    if chosenClient ~= nil then
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == chosenClient.name
        end,
        range = range,
      })
    end
  end)
end

M.lsp = function(bufnr)
  local opts = {
    buffer = bufnr,
    silent = true,
  }

  -- lspsaga
  -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
  -- vim.keymap.set("n", "gld", "<cmd>Lspsaga peek_definition<cr>", opts)
  -- vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
  -- vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  -- vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  -- vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

  vim.keymap.set("n", "glD", vim.lsp.buf.declaration, { desc = "[LSP] Declaration" })

  vim.keymap.set("n", "gld", vim.lsp.buf.definition, { desc = "[LSP] Definition" })

  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "[LSP] Hover" })

  vim.keymap.set("n", "gli", vim.lsp.buf.implementation, { desc = "[LSP] Implementation" })

  -- vim.keymap.set({ "n", "i" }, "<c-s>", vim.lsp.buf.signature_help, { desc = "[LSP] Signature Help" })

  vim.keymap.set("n", "glt", vim.lsp.buf.type_definition, { desc = "[LSP] Type Definition" })

  vim.keymap.set("n", "glr", lspRename, { desc = "[LSP] Rename" })

  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[LSP] Code Action" })

  vim.keymap.set("n", "glR", vim.lsp.buf.references, { desc = "[LSP] References" })

  vim.keymap.set({ "n", "v" }, "<leader>f", lspFormat, { desc = "[LSP] Format" })

  vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float({ border = "rounded" })
  end, { desc = "[Diagnostic] Current Line" })

  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Diagnostic] Location List" })

  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next({ float = false })
  end, { desc = "[Diagnostic] Next" })

  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev({ float = false })
  end, { desc = "[Diagnostic] Prev" })

  local goto_preview = require("goto-preview")

  vim.keymap.set("n", "glpd", goto_preview.goto_preview_definition, { desc = "[LSP] Goto Preview Definition" })
  vim.keymap.set(
    "n",
    "glpt",
    goto_preview.goto_preview_type_definition,
    { desc = "[LSP] Goto Preview Type Definition" }
  )
  vim.keymap.set("n", "glpi", goto_preview.goto_preview_implementation, { desc = "[LSP] Goto Preview Implementation" })
  vim.keymap.set("n", "glP", goto_preview.close_all_win, { desc = "[LSP] Goto Preview Close All Win" })
  -- Only set if you have telescope installed
  vim.keymap.set("n", "glpr", goto_preview.goto_preview_references, { desc = "[LSP] Goto Preview References" })

  vim.keymap.set(
    "n",
    "glwa",
    "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    { desc = "[LSP] Add Workspace Folder" }
  )
  vim.keymap.set(
    "n",
    "glwr",
    "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    { desc = "[LSP] Remove Workspace Folder" }
  )
  vim.keymap.set(
    "n",
    "glwl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    { desc = "[LSP] List Workspace Folders" }
  )

  -- local wk = require("which-key")
  --
  -- wk.register({
  --   g = {
  --     D = "LSP Declaration",
  --     d = "LSP Definition",
  --     t = "LSP Type Definition",
  --     r = "LSP Rename",
  --     i = "LSP Implementation",
  --     R = "LSP References",
  --   },
  --   ["<leader>"] = {
  --     f = "LSP Format",
  --     d = "Diagnostic Open",
  --   },
  --   ["]"] = {
  --     d = "Diagnostic Next",
  --   },
  --   ["["] = {
  --     d = "Diagnostic Prev",
  --   },
  -- })
end
-- 
-- 
return M
