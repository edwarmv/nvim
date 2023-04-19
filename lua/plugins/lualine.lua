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

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
  config = function()
    vim.opt.cmdheight = 0
    local navic = require("nvim-navic")
    require("lualine").setup({
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard" },
          winbar = { "neo-tree", "dashboard", "packer", "NvimTree", "aerial" },
        },
        globalstatus = true,
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = { { "b:gitsigns_head", icon = "" }, { "diff", source = diff_source } },
        lualine_c = {
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
          "zoom#statusline",
          "ObsessionStatus",
          "searchcount",
          "selectioncount",
          function()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
              return ""
            else
              return "Recording @" .. recording_register
            end
          end,
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
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {
        "fzf",
        "nvim-tree",
        "neo-tree",
        "quickfix",
        "aerial",
        nnn,
        floaterm,
        telescope,
        "lazy",
        "toggleterm",
        "trouble",
      },
    })
  end,
}

-- vim: foldmethod=marker
