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

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/noice.nvim",
    "letieu/harpoon-lualine",
    "akinsho/git-conflict.nvim",
  },
  config = function()
    vim.opt.cmdheight = 0

    require("lualine").setup({
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard" },
          winbar = {
            "neo-tree",
            "dashboard",
            "packer",
            "NvimTree",
            "aerial",
            "trouble",
            "noice",
            "lazy",
            "mason",
            "qf",
            "DiffviewFileHistory",
            "toggleterm",
            "NeogitStatus",
            "NeogitPopup",
            "NeogitDiffView",
            "undotree",
            "diff",
          },
        },
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
          { "filename", file_status = false },
          { conflict_count, color = { fg = "#b2555b" }, padding = { left = 0, right = 1 } },
          { "diff", source = diff_source, padding = { left = 0, right = 1 } },
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
            padding = { left = 0, right = 1 },
          },
        },
        lualine_x = {
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
            padding = { left = 0, right = 1 },
          },
          { "searchcount", padding = { left = 0, right = 1 } },
          { "selectioncount", padding = { left = 0, right = 1 } },
          { "filetype", padding = { left = 0, right = 1 } },
          {
            "harpoon2",
            no_harpoon = "",
            indicators = { "a", "s", "d", "f", "q", "w", "e", "r" },
            active_indicators = { "A", "S", "D", "F", "Q", "W", "E", "R" },
            padding = { left = 0, right = 1 },
          },
          { "zoom#statusline", padding = { left = 0, right = 1 } },
          { "ObsessionStatus", padding = { left = 0, right = 1 } },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      -- winbar = {
      --   lualine_c = {
      --     { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      --     { "filename", file_status = true, separator = "", padding = 0 },
      --     { "diff", source = diff_source, padding = { left = 1, right = 0 } },
      --     { conflict_count, color = { fg = "#b2555b" }, padding = { left = 1, right = 0 } },
      --     {
      --       "diagnostics",
      --       sources = { "nvim_diagnostic" }, -- coc nvim_diagnostic
      --       symbols = {
      --         error = icons.diagnostics.error,
      --         warn = icons.diagnostics.warn,
      --         info = icons.diagnostics.info,
      --         hint = icons.diagnostics.hint,
      --       },
      --       update_in_insert = false, -- Update diagnostics in insert mode
      --       padding = { left = 1, right = 0 },
      --     },
      --   },
      -- },
      -- inactive_winbar = {
      --   lualine_c = {
      --     { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      --     { "filename", file_status = true, separator = "", padding = 0 },
      --     { "diff", source = diff_source, padding = { left = 1, right = 0 } },
      --     { conflict_count, color = { fg = "#b2555b" }, padding = { left = 1, right = 0 } },
      --     {
      --       "diagnostics",
      --       sources = { "nvim_diagnostic" }, -- coc nvim_diagnostic
      --       symbols = {
      --         error = icons.diagnostics.error,
      --         warn = icons.diagnostics.warn,
      --         info = icons.diagnostics.info,
      --         hint = icons.diagnostics.hint,
      --       },
      --       update_in_insert = false, -- Update diagnostics in insert mode
      --       padding = { left = 1, right = 0 },
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
    })
  end,
}
