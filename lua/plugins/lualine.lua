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

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "SmiteshP/nvim-navic",
    "folke/noice.nvim",
    "letieu/harpoon-lualine",
    "akinsho/git-conflict.nvim",
    -- {
    --   "linrongbin16/lsp-progress.nvim",
    --   dependencies = { "nvim-tree/nvim-web-devicons" },
    --   config = function()
    --     require("lsp-progress").setup({})
    --   end,
    -- },
  },
  config = function()
    vim.opt.cmdheight = 0

    local function conflict_count()
      local count = require("git-conflict").conflict_count()
      return count > 0 and " " .. count or ""
    end

    local function global_diagnostics_status()
      local count = vim.diagnostic.count(nil)
      if count[vim.diagnostic.severity.ERROR] then
        return ""
      end
      if count[vim.diagnostic.severity.WARN] then
        return ""
      end
      if count[vim.diagnostic.severity.INFO] then
        return ""
      end
      if count[vim.diagnostic.severity.HINT] then
        return ""
      end
      return ""
    end

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
            "",
          },
        },
        globalstatus = true,
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          {
            "b:gitsigns_head",
            icon = "",
            fmt = function(value)
              if value ~= "" then
                local max_width = vim.o.columns * 1 / 8
                return string.len(value) <= max_width and value or string.sub(value, 1, max_width) .. "…"
              end
              return ""
            end,
          },
          -- { "diff", source = diff_source, padding = { left = 0, right = 1 } },
          -- { conflict_count, color = { fg = "#b2555b" }, padding = { left = 0, right = 1 } },
        },
        lualine_c = {
          -- { "filename", file_status = true },
          -- {
          --   "diagnostics",
          --   sources = { "nvim_diagnostic" }, -- coc nvim_diagnostic
          --   symbols = {
          --     error = icons.diagnostic.error,
          --     warn = icons.diagnostic.warn,
          --     info = icons.diagnostic.info,
          --     hint = icons.diagnostic.hint,
          --   },
          --   update_in_insert = false, -- Update diagnostics in insert mode
          -- },
          {
            "navic",
            color_correction = "dynamic",
            navic_opts = {
              click = true,
            },
          },
        },
        lualine_x = {
          -- {
          --   "diagnostics",
          --   sources = { "nvim_diagnostic" }, -- coc, nvim_diagnostic, nvim_workspace_diagnostic
          --   symbols = {
          --     error = icons.diagnostics.error,
          --     warn = icons.diagnostics.warn,
          --     info = icons.diagnostics.info,
          --     hint = icons.diagnostics.hint,
          --   },
          --   update_in_insert = false, -- Update diagnostics in insert mode
          --   padding = { left = 0, right = 1 },
          -- },
          -- { global_diagnostics_status },
          { "harpoon2", no_harpoon = "", padding = { left = 0, right = 1 } },
          { "zoom#statusline", padding = { left = 0, right = 1 } },
          { "ObsessionStatus", padding = { left = 0, right = 1 } },
          -- "searchcount",
          -- "selectioncount",
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
            padding = { left = 0, right = 1 },
          },
          { "filetype", padding = { left = 0, right = 1 } },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filename", file_status = true },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", file_status = true, separator = "", padding = 0 },
          { "diff", source = diff_source },
          { conflict_count, color = { fg = "#b2555b" } },
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
          },
        },
        lualine_x = {
          -- "filetype",
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", file_status = true, separator = "", padding = 0 },
          { "diff", source = diff_source },
          { conflict_count, color = { fg = "#b2555b" } },
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
          },
        },
        lualine_x = {
          -- "filetype",
        },
        lualine_y = {},
        lualine_z = {},
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
    })

    -- vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    -- vim.api.nvim_create_autocmd("User", {
    --   group = "lualine_augroup",
    --   pattern = "LspProgressStatusUpdated",
    --   callback = require("lualine").refresh,
    -- })
  end,
}

-- vim: foldmethod=marker
