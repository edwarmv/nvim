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
            "",
            "undotree",
            "diff",
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
        },
        lualine_c = {
          {
            "navic",
            color_correction = "dynamic",
            navic_opts = {
              click = true,
            },
          },
        },
        lualine_x = {
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
            padding = { left = 0, right = 1 },
          },
          { "filetype", padding = { left = 0, right = 1 } },
          { "harpoon2", no_harpoon = "", padding = { left = 0, right = 1 } },
          { "zoom#statusline", padding = { left = 0, right = 1 } },
          { "ObsessionStatus", padding = { left = 0, right = 1 } },
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
