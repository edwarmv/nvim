local utils = require("config.utils")
local defaults = require("config.defaults")
local icons = defaults.icons

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function conflict_count()
  local count = require("git-conflict").conflict_count()
  return count > 0 and " " .. count or ""
end

local function get_filename()
  local buftype = vim.bo.buftype
  if buftype == "" then
    local bufname = vim.api.nvim_buf_get_name(0)
    local filename = vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
    if filename == "" then
      filename = "[No Name]"
    end
    if vim.bo.modifiable == false or vim.bo.readonly == true then
      filename = filename .. " "
    end
    return filename
  else
    local filetype = vim.bo.filetype
    return filetype
  end
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      globalstatus = true,
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        { "mode" },
      },
      lualine_b = {
        {
          "b:gitsigns_head",
          icon = "",
          fmt = function(value)
            if value ~= "" then
              local max_width = vim.o.columns * 1 / 6
              return string.len(value) <= max_width and value or string.sub(value, 1, max_width) .. "…"
            end
            return ""
          end,
        },
      },
      lualine_c = {
        "aerial",
      },
      lualine_x = {
        { "filetype" },
        {
          "macro",
          fmt = function()
            local reg = vim.fn.reg_recording()
            if reg ~= "" then
              return "Recording @" .. reg
            end
            return nil
          end,
          color = function()
            return { fg = vim.g.terminal_color_3 }
          end,
          padding = { left = 0, right = 1 },
        },
        { "searchcount", padding = { left = 0, right = 1 } },
        { "selectioncount", padding = { left = 0, right = 1 } },
        -- { "zoom#statusline", padding = { left = 0, right = 1 } },
        { "ObsessionStatus", padding = { left = 0, right = 1 } },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    winbar = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        {
          get_filename,
          color = function()
            return {
              fg = vim.bo.modified and vim.g.terminal_color_2 or utils.get_hl("WinBar").fg,
              bg = utils.get_hl("WinBar").bg,
              gui = vim.bo.modified and "italic" or "none",
            }
          end,
          padding = 0,
        },
        { "diff", source = diff_source, padding = { left = 1, right = 0 } },
        {
          conflict_count,
          color = function()
            return { fg = utils.get_hl("Error").fg }
          end,
          padding = { left = 1, right = 0 },
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" }, -- coc nvim_diagnostic
          symbols = {
            error = icons.diagnostics.error,
            warn = icons.diagnostics.warn,
            info = icons.diagnostics.info,
            hint = icons.diagnostics.hint,
          },
          update_in_insert = false, -- Update diagnostics in insert mode
          padding = { left = 1, right = 0 },
        },
      },
    },
    inactive_winbar = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        {
          get_filename,
          color = function()
            return {
              fg = vim.bo.modified and vim.g.terminal_color_2 or utils.get_hl("StatuslineNC").fg,
              bg = utils.get_hl("StatuslineNC").bg,
              gui = vim.bo.modified and "italic" or "none",
            }
          end,
          padding = 0,
        },
        { "diff", source = diff_source, padding = { left = 1, right = 0 } },
        {
          conflict_count,
          color = function()
            return { fg = utils.get_hl("Error").fg }
          end,
          padding = { left = 1, right = 0 },
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" }, -- coc nvim_diagnostic
          symbols = {
            error = icons.diagnostics.error,
            warn = icons.diagnostics.warn,
            info = icons.diagnostics.info,
            hint = icons.diagnostics.hint,
          },
          update_in_insert = false, -- Update diagnostics in insert mode
          padding = { left = 1, right = 0 },
        },
      },
    },
    extensions = {
      "aerial",
      "fugitive",
      "fzf",
      "lazy",
      "man",
      "mason",
      "neo-tree",
      "nvim-dap-ui",
      "nvim-tree",
      "oil",
      "overseer",
      "quickfix",
      "toggleterm",
      "trouble",
    },
  },
}
