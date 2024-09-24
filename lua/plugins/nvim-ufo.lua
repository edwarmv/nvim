local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

local more_msg_highlight = vim.api.nvim_get_hl_id_by_name("MoreMsg")
local non_text_highlight = vim.api.nvim_get_hl_id_by_name("NonText")

-- https://github.com/kevinhwang91/nvim-ufo/issues/170#issue-1950445259
local handler_alt = function(
  -- The start_line's text.
  virtual_text_chunks,
  -- Start and end lines of fold.
  start_line,
  end_line,
  -- Total text width.
  text_width,
  -- fun(str: string, width: number): string Trunctation function.
  truncate,
  -- Context for the fold.
  ctx
)
  local line_delta = (" 󰁂 %d "):format(end_line - start_line)
  local remaining_width = text_width - vim.fn.strdisplaywidth(ctx.text) - vim.fn.strdisplaywidth(line_delta)
  table.insert(virtual_text_chunks, { line_delta, more_msg_highlight })
  local line = start_line
  while remaining_width > 0 and line < end_line do
    local line_text = vim.api.nvim_buf_get_lines(ctx.bufnr, line, line + 1, true)[1]
    line_text = " " .. vim.trim(line_text)
    local line_text_width = vim.fn.strdisplaywidth(line_text)
    if line_text_width <= remaining_width - 2 then
      remaining_width = remaining_width - line_text_width
    else
      line_text = truncate(line_text, remaining_width - 2) .. "…"
      remaining_width = remaining_width - vim.fn.strdisplaywidth(line_text)
    end
    table.insert(virtual_text_chunks, { line_text, non_text_highlight })
    line = line + 1
  end
  return virtual_text_chunks
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "VeryLazy",
  opts = {
    fold_virt_text_handler = handler_alt,
    provider_selector = function(bufnr, filetype, buftype)
      if buftype == "nofile" then
        return ""
      end

      return { "lsp", "indent" }
    end,
  },
}
