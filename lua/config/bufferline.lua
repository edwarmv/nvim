-- vim.o.laststatus = 3
-- local lazy = require("bufferline.lazy")
--
-- local constants = require("bufferline.constants")
-- local config = lazy.require("bufferline.config")
--
-- local strwidth = vim.fn.strwidth
-- local padding = constants.padding
--
-- local function tab_click_component(num)
--   return "%" .. num .. "T"
-- end
--
-- local function render(tabpage, is_active, style, highlights)
--   local h = highlights
--   local hl = is_active and h.tab_selected.hl or h.tab.hl
--   local separator_hl = is_active and h.separator_selected.hl or h.separator.hl
--   local separator_component = style == "thick" and "▐" or ""
--   local separator = separator_hl .. separator_component
--   local name = padding .. padding .. tabpage.tabnr .. padding
--   local length = strwidth(name) + strwidth(separator_component)
--   return hl .. tab_click_component(tabpage.tabnr) .. name .. separator, length
-- end
--
-- local function get()
--   local tabpages = {}
--   local tabs = vim.fn.gettabinfo()
--   local current_tab = vim.fn.tabpagenr()
--   local highlights = config.highlights
--   local style = config.options.separator_style
--   for i, tab in ipairs(tabs) do
--     local is_active_tab = current_tab == tab.tabnr
--     local component, length = render(tab, is_active_tab, style, highlights)
--
--     tabpages[i] = {
--       component = component,
--       length = length,
--       id = tab.tabnr,
--       windows = tab.windows,
--     }
--   end
--   return tabpages
-- end
--
-- local tabpages = require("bufferline.tabpages")
-- tabpages.get = get

require("bufferline").setup({
  options = {
    mode = "buffers", -- buffers set to "tabs" to only show tabpages instead
    numbers = "none",
    max_name_length = 999,
    indicator = {
      icon = "▍",
    },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    -- show_tab_indicators = true,
    diagnostics = "nvim_lsp", -- false | 'nvim_lsp'
    diagnostics_update_in_insert = false,
    -- separator_style = { "", "" },
    modified_icon = "[+]",
    always_show_bufferline = true,
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      local name = buf.name
      if name == "" then
        name = "[No name]"
      end
      return name
    end,
    -- offsets = {
    --   { filetype = "NvimTree", text = "File Explorer", text_align = "left" },
    --   { filetype = "vista_kind", text = "Vista", text_align = "left" },
    -- },
  },
})

--{{{
local highlights = {
  duplicate = { --{{{
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  duplicate_visible = {
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  duplicate_selected = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  }, --}}}
  fill = {
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  background = {
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  buffer = { --{{{
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  buffer_visible = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  buffer_selected = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  }, --}}}
  pick = { --{{{
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  pick_selected = {
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  pick_visible = {
    guibg = { attribute = "bg", highlight = "Normal" },
  }, --}}}
  diagnostic = { --{{{
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  diagnostic_visible = {
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  diagnostic_selected = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  }, --}}}
  info = { --{{{
    guifg = { attribute = "fg", highlight = "Comment" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  info_visible = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  info_selected = {
    gui = "italic,bold",
    guifg = { attribute = "fg", highlight = "Normal" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  info_diagnostic = {
    guifg = { attribute = "fg", highlight = "InfoFloat" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  info_diagnostic_visible = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  info_diagnostic_selected = {
    gui = "italic,bold",
    guifg = { attribute = "fg", highlight = "InfoFloat" },
    guibg = { attribute = "bg", highlight = "Normal" },
  }, --}}}
  warning = { --{{{
    guifg = { attribute = "fg", highlight = "Comment" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  warning_visible = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  warning_selected = {
    gui = "italic,bold",
    guifg = { attribute = "fg", highlight = "Normal" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  warning_diagnostic = {
    guifg = { attribute = "fg", highlight = "WarningFloat" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  warning_diagnostic_visible = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  warning_diagnostic_selected = {
    gui = "italic,bold",
    guifg = { attribute = "fg", highlight = "WarningFloat" },
    guibg = { attribute = "bg", highlight = "Normal" },
  }, --}}}
  error = { --{{{
    guifg = { attribute = "fg", highlight = "Comment" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  error_visible = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  error_selected = {
    gui = "italic,bold",
    guifg = { attribute = "fg", highlight = "Normal" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  error_diagnostic = {
    guifg = { attribute = "fg", highlight = "ErrorFloat" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  error_diagnostic_visible = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  error_diagnostic_selected = {
    gui = "italic,bold",
    guifg = { attribute = "fg", highlight = "ErrorFloat" },
    guibg = { attribute = "bg", highlight = "Normal" },
  }, --}}}
  hint = { --{{{
    guifg = { attribute = "fg", highlight = "Comment" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  hint_visible = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  hint_selected = {
    gui = "italic,bold",
    guifg = { attribute = "fg", highlight = "Normal" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  hint_diagnostic = {
    guifg = { attribute = "fg", highlight = "HintFloat" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  hint_diagnostic_visible = {
    gui = "italic,bold",
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  hint_diagnostic_selected = {
    gui = "italic,bold",
    guifg = { attribute = "fg", highlight = "HintFloat" },
    guibg = { attribute = "bg", highlight = "Normal" },
  }, --}}}
  modified = { --{{{
    guifg = { attribute = "fg", highlight = "Green" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  modified_visible = {
    guifg = { attribute = "fg", highlight = "Green" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  modified_selected = {
    guifg = { attribute = "fg", highlight = "Green" },
    guibg = { attribute = "bg", highlight = "Normal" },
  }, --}}}
  tab = {
    guifg = { attribute = "fg", highlight = "NormalNC" },
    -- guifg = { attribute = "fg", highlight = "NormalNC" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  tab_selected = {
    gui = "italic,bold",
    guifg = { attribute = "fg", highlight = "Normal" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  separator = {
    guifg = { attribute = "bg", highlight = "Normal" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  separator_visible = {
    guifg = { attribute = "bg", highlight = "Normal" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  separator_selected = {
    guifg = { attribute = "bg", highlight = "Normal" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
  indicator_selected = {
    guifg = { attribute = "fg", highlight = "Comment" },
    guibg = { attribute = "bg", highlight = "Normal" },
  },
}
--}}}

-- maps
--{{{
-- vim.api.nvim_set_keymap("n", "]b", "<cmd>BufferLineMoveNext<cr>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap("n", "[b", "<cmd>BufferLineMovePrev<cr>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap("n", "<c-right>", "<cmd>BufferLineMoveNext<cr>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap("n", "<c-left>", "<cmd>BufferLineMovePrev<cr>", { noremap = false, silent = true })
--
-- vim.api.nvim_set_keymap("n", "<leader>bse", "<cmd>BufferLineSortByExtension<CR>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>bsr",
--   "<cmd>BufferLineSortByRelativeDirectory<CR>",
--   { noremap = false, silent = true }
-- )
vim.api.nvim_set_keymap("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bd", "<cmd>BufferLinePickClose<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bDl", "<cmd>BufferLineCloseLeft<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bDr", "<cmd>BufferLineCloseRight<CR>", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { noremap = true, silent = true })
--}}}

-- vim: foldmethod=marker
