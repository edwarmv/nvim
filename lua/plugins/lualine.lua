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
    "folke/noice.nvim",
    "letieu/harpoon-lualine",
  },
  config = function()
    vim.opt.cmdheight = 0

    require("lualine").setup({
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard" },
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
            indicators = { "a", "s", "d", "f" },
            active_indicators = { "A", "S", "D", "F" },
            padding = { left = 0, right = 1 },
          },
          { "zoom#statusline", padding = { left = 0, right = 1 } },
          { "ObsessionStatus", padding = { left = 0, right = 1 } },
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
    })
  end,
}
