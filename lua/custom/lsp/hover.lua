local util = require("vim.lsp.util")
local api = vim.api

-- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/lsp/handlers.lua
vim.lsp.buf.hover = function()
  local params = util.make_position_params()
  local bufnr = vim.fn.bufnr("%")
  vim.lsp.buf_request_all(bufnr, "textDocument/hover", params, function(results)
    local config = { border = "single" }
    config.focus_id = "textDocument/hover"
    if api.nvim_get_current_buf() ~= bufnr then
      -- Ignore result since buffer changed. This happens for slow language servers.
      return
    end
    local contents = {}
    for _, result in pairs(results) do
      if result and result.result and result.result.contents and not vim.tbl_isempty(result.result.contents) then
        table.insert(contents, result.result.contents)
      end
    end
    local separate_content = {}
    for i, content in pairs(contents) do
      table.insert(separate_content, content)
      if i < #contents then
        table.insert(separate_content, "___")
      end
    end
    if vim.tbl_isempty(separate_content) then
      vim.notify("No information available")
      return
    end
    local markdown_lines = util.convert_input_to_markdown_lines(separate_content)
    markdown_lines = util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      vim.notify("No information available")
      return
    end
    return util.open_floating_preview(markdown_lines, "markdown", config)
  end)
end
