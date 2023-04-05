local navic = require("nvim-navic")
local icons = require("icons")
-- local custom_gruvbox_material = require("lualine.themes.gruvbox-material")
-- custom_gruvbox_material.com#1d202fmand.c.bg = "#3c3836"
-- custom_gruvbox_material.inactive.c.bg = "#3c3836"
-- custom_gruvbox_material.insert.c.bg = "#3c3836"
-- custom_gruvbox_material.normal.c.bg = "#3c3836"
-- custom_gruvbox_material.replace.c.bg = "#3c3836"
-- custom_gruvbox_material.terminal.c.bg = "#3c3836"
-- custom_gruvbox_material.visual.c.bg = "#3c3836"

vim.o.laststatus = 3
vim.o.cmdheight = 1
vim.g.qf_disable_statusline = true

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

local fern = { --{{{
  sections = {
    lualine_a = {
      {
        function()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
        end,
      },
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        function()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
        end,
      },
    },
  },
  filetypes = { "fern" },
} --}}}

local aerial = { --{{{
  sections = {
    lualine_a = {
      {
        function()
          return "Aerial"
        end,
      },
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        function()
          return "Aerial"
        end,
      },
    },
  },
  filetypes = { "aerial" },
} --}}}

local nnn = { --{{{
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
} --}}}

local floaterm = { --{{{
  sections = {
    lualine_a = {
      {
        function()
          return "Floaterm"
        end,
      },
    },
    lualine_c = {
      -- {
      --   function()
      --     return vim.call("FloatermInfo")
      --   end,
      -- },
    },
  },
  inactive_sections = {
    lualine_a = {
      {
        function()
          return "Floaterm"
        end,
      },
    },
    lualine_c = {
      -- {
      --   function()
      --     return vim.call("FloatermInfo")
      --   end,
      -- },
    },
  },
  filetypes = { "floaterm" },
} --}}}

local telescope = { --{{{
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
} --}}}

require("lualine").setup({
  options = {
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "dashboard" },
      winbar = { "neo-tree", "dashboard", "packer", "NvimTree", "aerial" },
    },
    -- theme = "onedark-nvim"
    -- theme = "edge",
    -- theme = "gruvbox-material",
    -- theme = "catppuccin",
    globalstatus = true,
    always_divide_middle = true,
    -- refresh = {
    --   statusline = 0,
    --   tabline = 0,
    --   winbar = 0,
    -- },
    -- theme = custom_gruvbox_material,
  },
  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = { { "b:gitsigns_head", icon = "" }, { "diff", source = diff_source } },
    lualine_c = {
      -- 'diff',
      -- "filename",
      -- "require('nvim-lightbulb').get_status_text()",
      -- "lsp_progress",
      {
        function()
          return navic.get_location()
        end,
        cond = function()
          return navic.is_available()
        end,
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" }, -- coc nvim_diagnostic
        symbols = {
          error = icons.diagnostic.error,
          warn = icons.diagnostic.warn,
          info = icons.diagnostic.info,
          hint = icons.diagnostic.hint,
        },
        update_in_insert = false, -- Update diagnostics in insert mode
      },
      -- {
      --   require("noice").api.statusline.mode.get,
      --   cond = require("noice").api.statusline.mode.has,
      -- },
      "zoom#statusline",
      "ObsessionStatus",
      -- { require("auto-session-library").current_session_name, icon = { "", color = { fg = "#89b482" } } },
      -- "searchcount",
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
      -- "lsp_progress",
    },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  -- winbar = {
  --   lualine_c = { "filename" },
  -- },
  -- inactive_winbar = {
  --   lualine_c = { "filename" },
  -- },
  extensions = { "fzf", "nvim-tree", "neo-tree", "quickfix", "aerial", nnn, floaterm, telescope },
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("LualineAuGroup", {}),
  callback = require("lualine").refresh,
})

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "CocStatusChange",
--   callback = function()
--     require('lualine').refresh()
--   end,
-- })

-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--   callback = function()
--     require("lualine").hide({ place = { "statusline" } })
--   end,
-- })
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--   callback = function()
--     require("lualine").hide({ unhide = true })
--   end,
-- })

-- vim: foldmethod=marker
