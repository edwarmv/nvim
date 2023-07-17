local util = require("vim.lsp.util")
local api = vim.api

vim.lsp.buf.rename = function(new_name, options)
  options = options or {}
  local bufnr = options.bufnr or api.nvim_get_current_buf()
  local clients = vim.lsp.get_active_clients({
    bufnr = bufnr,
    name = options.name,
    -- Clients must at least support rename, prepareRename is optional
    method = 'textDocument/rename',
  })
  if options.filter then
    clients = vim.tbl_filter(options.filter, clients)
  end

  if #clients == 0 then
    vim.notify("[LSP] Rename, no matching language servers with rename capability.")
    return
  end

  local win = api.nvim_get_current_win()

  -- Compute early to account for cursor movements after going async
  local cword = vim.fn.expand("<cword>")

  ---@private
  local function get_text_at_range(range, offset_encoding)
    return api.nvim_buf_get_text(
      bufnr,
      range.start.line,
      util._get_line_byte_from_position(bufnr, range.start, offset_encoding),
      range["end"].line,
      util._get_line_byte_from_position(bufnr, range["end"], offset_encoding),
      {}
    )[1]
  end

  vim.ui.select(clients, {
    prompt = "Select a language server:",
    format_item = function(item)
      return item.name
    end,
  }, function(client)
    if not client then
      return
    end

    ---@private
    local function rename(name)
      local params = util.make_position_params(win, client.offset_encoding)
      params.newName = name
      local handler = client.handlers["textDocument/rename"] or vim.lsp.handlers["textDocument/rename"]
      client.request("textDocument/rename", params, function(...)
        handler(...)
      end, bufnr)
    end

    if client.supports_method("textDocument/prepareRename") then
      local params = util.make_position_params(win, client.offset_encoding)
      client.request("textDocument/prepareRename", params, function(err, result)
        if err or result == nil then
          local msg = err and ("Error on prepareRename: " .. (err.message or "")) or "Nothing to rename"
          vim.notify(msg, vim.log.levels.INFO)
          return
        end

        if new_name then
          rename(new_name)
          return
        end

        local prompt_opts = {
          prompt = "New Name: ",
        }
        -- result: Range | { range: Range, placeholder: string }
        if result.placeholder then
          prompt_opts.default = result.placeholder
        elseif result.start then
          prompt_opts.default = get_text_at_range(result, client.offset_encoding)
        elseif result.range then
          prompt_opts.default = get_text_at_range(result.range, client.offset_encoding)
        else
          prompt_opts.default = cword
        end
        vim.ui.input(prompt_opts, function(input)
          if not input or #input == 0 then
            return
          end
          rename(input)
        end)
      end, bufnr)
    else
      assert(client.supports_method("textDocument/rename"), "Client must support textDocument/rename")
      if new_name then
        rename(new_name)
        return
      end

      local prompt_opts = {
        prompt = "New Name: ",
        default = cword,
      }
      vim.ui.input(prompt_opts, function(input)
        if not input or #input == 0 then
          return
        end
        rename(input)
      end)
    end
  end)
end
