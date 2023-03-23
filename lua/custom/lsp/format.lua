local util = require("vim.lsp.util")
local api = vim.api

local function range_from_selection()
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
  return {
    ["start"] = { start_row, start_col - 1 },
    ["end"] = { end_row, end_col - 1 },
  }
end

vim.lsp.buf.format = function(options)
  options = options or {}
  local bufnr = options.bufnr or api.nvim_get_current_buf()
  local clients = vim.lsp.get_active_clients({
    id = options.id,
    bufnr = bufnr,
    name = options.name,
  })

  if options.filter then
    clients = vim.tbl_filter(options.filter, clients)
  end

  clients = vim.tbl_filter(function(client)
    return client.supports_method("textDocument/formatting")
  end, clients)

  if #clients == 0 then
    vim.notify("[LSP] Format request failed, no matching language servers.")
    return
  end

  local mode = api.nvim_get_mode().mode
  local range = options.range
  if not range and mode == "v" or mode == "V" then
    range = range_from_selection()
  end

  ---@private
  local function set_range(client, params)
    if range then
      local range_params = util.make_given_range_params(range.start, range["end"], bufnr, client.offset_encoding)
      params.range = range_params.range
    end
    return params
  end

  local method = range and "textDocument/rangeFormatting" or "textDocument/formatting"
  if options.async then
    vim.ui.select(clients, {
      prompt = "Select a language server:",
      format_item = function(item)
        return item.name
      end,
    }, function(client)
      if not client then
        return
      end
      local params = set_range(client, util.make_formatting_params(options.formatting_options))
      client.request(method, params, function(...)
        local handler = client.handlers[method] or vim.lsp.handlers[method]
        handler(...)
      end, bufnr)
    end)
  else
    local timeout_ms = options.timeout_ms or 1000
    vim.ui.select(clients, {
      prompt = "Select a language server:",
      format_item = function(item)
        return item.name
      end,
    }, function(client)
      if not client then
        return
      end
      local params = set_range(client, util.make_formatting_params(options.formatting_options))
      local result, err = client.request_sync(method, params, timeout_ms, bufnr)
      if result and result.result then
        util.apply_text_edits(result.result, bufnr, client.offset_encoding)
      elseif err then
        vim.notify(string.format("[LSP][%s] %s", client.name, err), vim.log.levels.WARN)
      end
    end)
  end
end
