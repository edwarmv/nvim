local stringx = require("pl.stringx")
local types = require("cmp.types")

--{{{
-- local c_window = require("cmp.utils.window")
-- function c_window:info()
--   local border_info = self:get_border_info()
--   local info = {
--     row = self.style.row,
--     col = self.style.col,
--     width = self.style.width + border_info.left + border_info.right,
--     height = self.style.height + border_info.top + border_info.bottom,
--     inner_width = self.style.width,
--     inner_height = self.style.height,
--     border_info = border_info,
--     scrollable = false,
--     scrollbar_offset = 0,
--   }
--
--   if self:get_content_height() > info.inner_height then
--     info.scrollable = false
--     if not border_info.visible then
--       info.scrollbar_offset = 1
--       info.width = info.width + 1
--     end
--   end
--
--   return info
-- end
--}}}

--{{{
local str = require("cmp.utils.str")

local misc = require("cmp.utils.misc")
local config = require("cmp.config")

--{{{
local api = require("cmp.utils.api")
local buffer = require("cmp.utils.buffer")
local window = require("cmp.utils.window")

function window:update()
  local info = self:info()
  if info.scrollable then
    -- Draw the background of the scrollbar

    if not info.border_info.visible then
      local style = {
        relative = "editor",
        style = "minimal",
        width = 1,
        height = self.style.height,
        row = info.row,
        col = info.col + info.width - info.scrollbar_offset, -- info.col was already contained the scrollbar offset.
        zindex = (self.style.zindex and (self.style.zindex + 1) or 1),
      }
      if self.sbar_win and vim.api.nvim_win_is_valid(self.sbar_win) then
        vim.api.nvim_win_set_config(self.sbar_win, style)
      else
        style.noautocmd = true
        self.sbar_win = vim.api.nvim_open_win(buffer.ensure(self.name .. "sbar_buf"), false, style)
        vim.api.nvim_win_set_option(self.sbar_win, "winhighlight", "EndOfBuffer:PmenuSbar,NormalFloat:PmenuSbar")
      end
    end

    -- Draw the scrollbar thumb
    -- HACK: Avoid overflow
    local thumb_height = math.floor(info.inner_height * (info.inner_height / self:get_content_height()) + 0.5)
    -- avoid scroll thumb overflow when inner_height = 1
    local thumb_offset = 0
    if info.inner_height > 0 then
      thumb_offset = math.floor(info.inner_height * (vim.fn.getwininfo(self.win)[1].topline / self:get_content_height()))
    end

    local style = {
      relative = "editor",
      style = "minimal",
      width = 1,
      height = math.max(1, thumb_height),
      row = info.row + thumb_offset + (info.border_info.visible and info.border_info.top or 0),
      col = info.col + info.width - 1, -- info.col was already added scrollbar offset.
      zindex = (self.style.zindex and (self.style.zindex + 2) or 2),
    }
    if self.thumb_win and vim.api.nvim_win_is_valid(self.thumb_win) then
      vim.api.nvim_win_set_config(self.thumb_win, style)
    else
      style.noautocmd = true
      self.thumb_win = vim.api.nvim_open_win(buffer.ensure(self.name .. "thumb_buf"), false, style)
      vim.api.nvim_win_set_option(self.thumb_win, "winhighlight", "EndOfBuffer:PmenuThumb,NormalFloat:PmenuThumb")
    end
  else
    if self.sbar_win and vim.api.nvim_win_is_valid(self.sbar_win) then
      vim.api.nvim_win_hide(self.sbar_win)
      self.sbar_win = nil
    end
    if self.thumb_win and vim.api.nvim_win_is_valid(self.thumb_win) then
      vim.api.nvim_win_hide(self.thumb_win)
      self.thumb_win = nil
    end
  end

  -- In cmdline, vim does not redraw automatically.
  if api.is_cmdline_mode() then
    vim.api.nvim_win_call(self.win, function()
      misc.redraw()
    end)
  end
end
--}}}

local c_entry = require("cmp.entry")

function c_entry:get_documentation(width) --{{{
  local item = self:get_completion_item()

  local documents = {}

  local function getFiletype()
    local ft = self.context.filetype
    local dot_index = string.find(ft, "%.")
    if dot_index ~= nil then
      ft = string.sub(ft, 0, dot_index - 1)
    end
    return ft
  end

  local function splitString(value)
    if not width or #value <= width then
      return value
    end

    return stringx.fill(value, width, true)
  end

  local function splitStringsTable(value)
    if not width then
      return value
    end
    local splitedTable = value
    local stringsTable = {}
    if splitedTable ~= nil then
      stringsTable = stringx.splitlines(splitedTable)
    else
      stringsTable = splitedTable
    end
    local copyStringsTable = {}
    for _, line in pairs(stringsTable) do
      if line ~= "" then
        table.insert(copyStringsTable, splitString(line))
      end
    end
    splitedTable = stringx.join("\n", copyStringsTable)
    return splitedTable
  end

  -- label
  local label = item.label
  local _width = math.floor(vim.opt.columns:get() / 4)
  if label and item.label ~= "" and #label > _width then
    table.insert(documents, {
      kind = types.lsp.MarkupKind.Markdown,
      value = ("```%s\n%s\n```"):format(getFiletype(), splitString(label)),
    })
  end

  -- detail
  if item.detail and item.detail ~= "" then
    table.insert(documents, {
      kind = types.lsp.MarkupKind.Markdown,
      value = ("```%s\n%s\n```"):format(getFiletype(), str.trim(splitString(item.detail))),
    })
  end

  local documentation = item.documentation
  if type(documentation) == "string" and documentation ~= "" then
    local value = str.trim(splitString(documentation))
    if value ~= "" then
      table.insert(documents, {
        kind = types.lsp.MarkupKind.PlainText,
        value = value,
      })
    end
  elseif type(documentation) == "table" and not misc.empty(documentation.value) then
    local value = str.trim(splitStringsTable(documentation.value))
    if value ~= "" then
      table.insert(documents, {
        kind = documentation.kind,
        value = value,
      })
    end
  end

  return vim.lsp.util.convert_input_to_markdown_lines(documents)
end --}}}

local c_docs_view = require("cmp.view.docs_view")

function c_docs_view:open(e, view) --{{{
  local documentation = config.get().window.documentation
  if not documentation then
    return
  end

  if not e or not view then
    return self:close()
  end

  local border_info = window.get_border_info({ style = documentation })
  local right_space = vim.o.columns - (view.col + view.width) - 1
  local left_space = view.col - 1
  local max_width = math.min(documentation.max_width, math.max(left_space, right_space))

  local width, height = 0, 0

  -- Update buffer content if needed.
  if not self.entry or e.id ~= self.entry.id then
    local documents = e:get_documentation()
    if #documents == 0 then
      return self:close()
    end

    self.entry = e
    vim.api.nvim_buf_call(self.window:get_buffer(), function()
      vim.cmd([[syntax clear]])
      vim.api.nvim_buf_set_lines(self.window:get_buffer(), 0, -1, false, {})
    end)
    vim.lsp.util.stylize_markdown(self.window:get_buffer(), documents, {
      max_width = max_width - border_info.horiz,
      max_height = documentation.max_height - border_info.vert,
    })

    -- Calculate window size.
    width, height =
      vim.lsp.util._make_floating_popup_size(vim.api.nvim_buf_get_lines(self.window:get_buffer(), 0, -1, false), {
        max_width = max_width - border_info.horiz,
        max_height = documentation.max_height - border_info.vert,
      })

    -- HACK: fits the window size to new wrapped content
    documents = e:get_documentation(width)

    vim.lsp.util.stylize_markdown(self.window:get_buffer(), documents, {
      max_width = max_width - border_info.horiz,
      max_height = documentation.max_height - border_info.vert,
    })
    width, height =
      vim.lsp.util._make_floating_popup_size(vim.api.nvim_buf_get_lines(self.window:get_buffer(), 0, -1, false), {
        max_width = max_width - border_info.horiz,
        max_height = documentation.max_height - border_info.vert,
      })
  end

  if width <= 0 or height <= 0 then
    return self:close()
  end

  -- Calculate window position.
  local right_col = view.col + view.width
  local left_col = view.col - width - border_info.horiz
  local col, left
  if right_space >= width and left_space >= width then
    if right_space < left_space then
      col = left_col
      left = true
    else
      col = right_col
    end
  elseif right_space >= width then
    col = right_col
  elseif left_space >= width then
    col = left_col
    left = true
  else
    return self:close()
  end

  -- Render window.
  self.window:option("winblend", vim.o.pumblend)
  self.window:option("winhighlight", documentation.winhighlight)
  local style = {
    relative = "editor",
    style = "minimal",
    width = width,
    height = height,
    row = view.row,
    col = col,
    border = documentation.border,
    zindex = documentation.zindex or 50,
  }

  -- HACK: resets the position of scrollbar
  vim.api.nvim_buf_call(self.window:get_buffer(), function()
    vim.api.nvim_command("normal! " .. 1 .. "zt")
  end)

  self.window:open(style)

  -- Correct left-col for scrollbar existence.
  if left then
    style.col = style.col - self.window:info().scrollbar_offset
    self.window:open(style)
  end
end --}}}

function c_docs_view:close()
  vim.api.nvim_buf_call(self.window:get_buffer(), function()
    vim.api.nvim_command("normal! " .. 1 .. "zt")
  end)
  self.window:close()
  self.entry = nil
end

-- function c_docs_view:scroll(delta)
--   if self:visible() then
--     local info = vim.fn.getwininfo(self.window.win)[1] or {}
--     local top = info.topline or 1
--     top = top + delta
--     top = math.max(top, 1)
--     top = math.min(top, self.window:get_content_height() - info.height + 1)
--
--     vim.defer_fn(function()
--       vim.api.nvim_buf_call(self.window:get_buffer(), function()
--         vim.api.nvim_command("normal! " .. top .. "zt")
--         self.window:update()
--       end)
--     end, 0)
--   end
-- end

-- function c_docs_view:scroll(delta) --{{{
--   if self:visible() then
--     local info = vim.fn.getwininfo(self.window.win)[1] or {}
--     local top = info.topline or 1
--
--     -- HACK: allows to scroll the window the same amount of lines viewed in window
--     top = top + info.height * delta
--
--     -- top = math.max(top, 1)
--     -- top = math.min(top, self.window:get_content_height() - info.height + 1)
--
--     vim.defer_fn(function()
--       vim.api.nvim_buf_call(self.window:get_buffer(), function()
--         vim.api.nvim_command("normal! " .. top .. "zt")
--         self.window:update()
--       end)
--     end, 0)
--   end
-- end --}}}
--}}}

-- local cmp_window = require("cmp.utils.window")
-- function cmp_window:has_scrollbar()
--   return false
-- end

-- vim: foldmethod=marker
