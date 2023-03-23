local M = {}
local bufnr = vim.fn.bufnr()
local render = false

local status_web_devicons_ok, web_devicons = pcall(require, 'nvim-web-devicons')

local hl_winbar_path = 'WinBarPath'
local hl_winbar_file = 'WinBarFile'
local hl_winbar_file_icon = 'WinBarFileIcon'

local opts = {
  exclude_filetype = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "alpha",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "qf",
  },
}

-- if vim.bo[bufnr].buftype ~= "terminal" then
--   render = true
-- end
--
-- if vim.bo[bufnr].buftype ~= "terminal" then
--   render = true
-- end

local excludes = function()
  if vim.tbl_contains(opts.exclude_filetype, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end

  return false
end

local f = {}

function f.isempty(s)
    return s == nil or s == ''
end

function f.get_buf_option(opt)
    local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
    if not status_ok then
        return nil
    else
        return buf_option
    end
end

local winbar_file = function()
    local file_path = vim.fn.expand('%:~:.:h')
    local filename = vim.fn.expand('%:t')
    local file_type = vim.fn.expand('%:e')
    local value = ''
    local file_icon = ''

    file_path = file_path:gsub('^%.', '')
    file_path = file_path:gsub('^%/', '')

    if not f.isempty(filename) then
        local default = false

        if f.isempty(file_type) then
            file_type = ''
            default = true
        end

        if status_web_devicons_ok then
            file_icon = web_devicons.get_icon(filename, file_type, { default = default })
            hl_winbar_file_icon = "DevIcon" .. file_type
        end

        if not file_icon then
            file_icon = opts.icons.file_icon_default
        end

        file_icon = '%#' .. hl_winbar_file_icon .. '#' .. file_icon .. ' %*'

        value = ' '
        if opts.show_file_path then
            local file_path_list = {}
            local _ = string.gsub(file_path, '[^/]+', function(w)
                table.insert(file_path_list, w)
            end)

            for i = 1, #file_path_list do
                value = value .. '%#' .. hl_winbar_path .. '#' .. file_path_list[i] .. ' ' .. opts.icons.seperator .. ' %*'
            end
        end
        value = value .. file_icon
        value = value .. '%#' .. hl_winbar_file .. '#' .. filename .. '%*'
    end

    return value

end

M.init = function()
  local value = winbar_file()
  print(value)
    vim.o.winbar = 'hola'
  -- return value
end

-- local show_winbar = function()
--   -- if excludes() then
--   --   return
--   -- end
--
--   local value = winbar_file()
--
-- vim.wo.winbar = value
--   -- local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
--   -- if not status_ok then
--   --   return
--   -- end
-- end

-- vim.api.nvim_create_autocmd({
--   "DirChanged",
--   "CursorMoved",
--   "BufWinEnter",
--   "BufFilePost",
--   "InsertEnter",
--   "BufWritePost",
-- }, {
--   callback = function()
--     show_winbar()
--   end,
-- })
-- local value = winbar_file()
-- print(value)
return M
