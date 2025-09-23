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
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      section_separators = "",
      component_separators = { left = "⟩", right = "⟨" },
      globalstatus = true,
      always_divide_middle = true,
      disabled_filetypes = {
        statusline = { "snacks_dashboard" },
        winbar = { "", "dap-view", "dap-repl", "snacks_layout_box", "qf", "neo-tree", "toggleterm", "snacks_dashboard" },
      },
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
              local max_width = vim.o.columns * 1 / 4
              return string.len(value) <= max_width and value or string.sub(value, 1, max_width) .. "…"
            end
            return ""
          end,
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
        {
          get_filename,
          color = function()
            local has_erros = false
            if vim.fn.mode() ~= "i" then
              has_erros = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }) > 0
            end

            return {
              fg = has_erros and utils.get_hl("Error").fg
                or vim.bo.modified and vim.g.terminal_color_2
                or utils.get_hl("lualine_c_normal").fg,
              gui = vim.bo.modified and "italic" or "none",
            }
          end,
        },
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
        {
          macro,
          color = function()
            return { fg = vim.g.terminal_color_3 }
          end,
        },
        "searchcount",
        "selectioncount",
        "ObsessionStatus",
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    -- winbar = {
    --   lualine_c = {
    --     {
    --       function()
    --         return " "
    --       end,
    --       separator = "",
    --       padding = 0,
    --     },
    --     { "filetype", icon_only = true, separator = "", padding = 0 },
    --     {
    --       get_filename,
    --       color = function()
    --         local has_erros = false
    --         if vim.fn.mode() ~= "i" then
    --           has_erros = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }) > 0
    --         end
    --
    --         return {
    --           fg = has_erros and utils.get_hl("Error").fg
    --             or vim.bo.modified and vim.g.terminal_color_2
    --             or utils.get_hl("lualine_c_normal").fg,
    --           bg = utils.get_hl("lualine_c_normal").bg,
    --           gui = vim.bo.modified and "italic" or "none",
    --         }
    --       end,
    --       padding = { left = 0, right = 1 },
    --     },
    --     { "diff", source = diff_source },
    --     {
    --       conflict_count,
    --       color = function()
    --         return { fg = utils.get_hl("Error").fg }
    --       end,
    --     },
    --     {
    --       "diagnostics",
    --       sources = { "nvim_diagnostic" },
    --       symbols = {
    --         error = icons.diagnostics.error,
    --         warn = icons.diagnostics.warn,
    --         info = icons.diagnostics.info,
    --         hint = icons.diagnostics.hint,
    --       },
    --       update_in_insert = false,
    --     },
    --   },
    -- },
    -- inactive_winbar = {
    --   lualine_c = {
    --     {
    --       function()
    --         return " "
    --       end,
    --       separator = "",
    --       padding = 0,
    --     },
    --     { "filetype", colored = false, icon_only = true, separator = "", padding = 0 },
    --     {
    --       get_filename,
    --       color = function()
    --         return {
    --           fg = utils.get_hl("lualine_c_inactive").fg,
    --           bg = utils.get_hl("lualine_c_inactive").bg,
    --           gui = vim.bo.modified and "italic" or "none",
    --         }
    --       end,
    --       padding = { left = 0, right = 1 },
    --     },
    --     { "diff", source = diff_source, colored = false },
    --     {
    --       conflict_count,
    --     },
    --     {
    --       "diagnostics",
    --       colored = false,
    --       sources = { "nvim_diagnostic" },
    --       symbols = {
    --         error = icons.diagnostics.error,
    --         warn = icons.diagnostics.warn,
    --         info = icons.diagnostics.info,
    --         hint = icons.diagnostics.hint,
    --       },
    --       update_in_insert = false,
    --     },
    --   },
    -- },
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
