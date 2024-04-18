local icons = require("config.icons")

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

local nnn = {
  sections = {
    lualine_a = {
      {
        function()
          return "nnn"
        end,
      },
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        function()
          return "nnn"
        end,
      },
    },
  },
  filetypes = { "nnn" },
}

local telescope = {
  sections = {
    lualine_a = {
      {
        function()
          return "Telescope"
        end,
      },
    },
  },
  inactive_sections = {
    lualine_a = {
      {
        function()
          return "Telescope"
        end,
      },
    },
  },
  filetypes = { "TelescopePrompt" },
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "SmiteshP/nvim-navic",
    "folke/noice.nvim",
    "ecthelionvi/NeoComposer.nvim",
    "abeldekat/harpoonline",
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
    local Harpoonline = require("harpoonline")
    Harpoonline.setup({
      on_update = function()
        require("lualine").refresh()
      end,
      formatter = "short",
    })

    vim.opt.cmdheight = 0

    local function conflict_count()
      local count = require("git-conflict").conflict_count()
      return count > 0 and " " .. count or ""
    end

    require("lualine").setup({
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard" },
          winbar = { "neo-tree", "dashboard", "packer", "NvimTree", "aerial", "Trouble", "qf", "DiffviewFileHistory" },
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
          { "diff", source = diff_source },
          { conflict_count, color = { fg = "#b2555b" } },
        },
        lualine_c = {
          { "filename", file_status = true },
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
          Harpoonline.format,
          {
            "diagnostics",
            sources = { "nvim_diagnostic" }, -- coc, nvim_diagnostic, nvim_workspace_diagnostic
            symbols = {
              error = icons.diagnostic.error,
              warn = icons.diagnostic.warn,
              info = icons.diagnostic.info,
              hint = icons.diagnostic.hint,
            },
            update_in_insert = false, -- Update diagnostics in insert mode
          },
          "zoom#statusline",
          "ObsessionStatus",
          -- "searchcount",
          "selectioncount",
          require("NeoComposer.ui").status_recording,
          -- {
          --   require("noice").api.status.command.get,
          --   cond = require("noice").api.status.command.has,
          --   color = { fg = "#ff9e64" },
          --   -- color = { fg = "#e78a4e", bg = "#3c3836" },
          -- },
          -- {
          --   require("noice").api.status.mode.get,
          --   cond = require("noice").api.status.mode.has,
          --   color = { fg = "#ff9e64" },
          --   -- color = { fg = "#e78a4e", bg = "#3c3836" },
          -- },
          -- { require("auto-session-library").current_session_name, icon = { "", color = { fg = "#89b482" } } },
          "filetype",
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
      -- winbar = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {
      --     { "filetype", icon_only = true, separator = "", padding = { right = 0, left = 1 } },
      --     { "filename", file_status = true, separator = "", padding = { right = 0, left = 1 } },
      --     {
      --       "diagnostics",
      --       sources = { "nvim_diagnostic" }, -- coc nvim_diagnostic
      --       symbols = {
      --         error = icons.diagnostic.error,
      --         warn = icons.diagnostic.warn,
      --         info = icons.diagnostic.info,
      --         hint = icons.diagnostic.hint,
      --       },
      --       update_in_insert = false, -- Update diagnostics in insert mode
      --     },
      --   },
      --   lualine_x = {
      --     -- "filetype",
      --   },
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      -- inactive_winbar = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {
      --     { "filetype", icon_only = true, separator = "", padding = { right = 0, left = 1 } },
      --     { "filename", file_status = true, separator = "", padding = { right = 0, left = 1 } },
      --     {
      --       "diagnostics",
      --       sources = { "nvim_diagnostic" }, -- coc nvim_diagnostic
      --       symbols = {
      --         error = icons.diagnostic.error,
      --         warn = icons.diagnostic.warn,
      --         info = icons.diagnostic.info,
      --         hint = icons.diagnostic.hint,
      --       },
      --       update_in_insert = false, -- Update diagnostics in insert mode
      --     },
      --   },
      --   lualine_x = {
      --     -- "filetype",
      --   },
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      extensions = {
        "fzf",
        "nvim-tree",
        "neo-tree",
        "quickfix",
        "aerial",
        nnn,
        telescope,
        "lazy",
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
