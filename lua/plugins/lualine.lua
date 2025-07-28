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

local function macro()
  local reg = vim.fn.reg_recording()
  if reg ~= "" then
    return "Recording @" .. reg
  end
  return ""
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
      section_separators = "",
      component_separators = { left = "⟩", right = "⟨" },
      globalstatus = true,
      always_divide_middle = true,
    },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    sections = {
      lualine_a = {
        { "mode" },
      },
      lualine_b = {
        {
          "b:gitsigns_head",
          icon = "",
        },
        { "diff", source = diff_source },
        {
          conflict_count,
          color = function()
            return { fg = utils.get_hl("Error").fg }
          end,
        },
      },
      lualine_c = {
        -- "aerial",
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = icons.diagnostics.error,
            warn = icons.diagnostics.warn,
            info = icons.diagnostics.info,
            hint = icons.diagnostics.hint,
          },
          update_in_insert = false,
        },
        "filetype",
        {
          macro,
          color = function()
            return { fg = vim.g.terminal_color_3 }
          end,
        },
        "searchcount",
        "selectioncount",
        "ObsessionStatus",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = {
      "aerial",
      "chadtree",
      "ctrlspace",
      "fern",
      "fugitive",
      "fzf",
      "lazy",
      "man",
      "mason",
      "mundo",
      "neo-tree",
      "nerdtree",
      "nvim-dap-ui",
      "nvim-tree",
      "oil",
      "overseer",
      "quickfix",
      "symbols-outline",
      "toggleterm",
      "trouble",
    },
  },
}
