require("config.nvim-tree.custom")

local icons = require("icons")

local find_file = require("nvim-tree.actions.finders.find-file")

local print_node_path = function(node)
  -- print(vim.inspect(node))
  -- print(node.name)
  print(node.absolute_path)
end

-- function _G.show_file_name()
--   local node = require("nvim-tree.lib").get_node_at_cursor()
--   if not node or not node.absolute_path then
--     return
--   end
--   print(node.absolute_path)
-- end

require("nvim-tree").setup({
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  sync_root_with_cwd = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  view = {
    width = {
      min = 30,
      max = -1,
    },
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = true,
    number = false,
    relativenumber = false,
    signcolumn = "no",
    mappings = {
      custom_only = true,
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "<C-e>", action = "edit_in_place" },
        { key = "O", action = "edit_no_picker" },
        { key = { "}", "<2-RightMouse>" }, action = "cd" },
        { key = "<C-v>", action = "vsplit" },
        { key = "<C-s>", action = "split" },
        { key = "<C-t>", action = "tabnew" },
        { key = "<", action = "prev_sibling" },
        { key = ">", action = "next_sibling" },
        { key = "P", action = "parent_node" },
        { key = "<BS>", action = "close_node" },
        { key = "<Tab>", action = "preview" },
        { key = "<C-k>", action = "first_sibling" },
        { key = "<C-j>", action = "last_sibling" },
        { key = "I", action = "toggle_git_ignored" },
        { key = "H", action = "toggle_dotfiles" },
        { key = "U", action = "toggle_custom" },
        { key = "R", action = "refresh" },
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = "<C-r>", action = "full_rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "[e", action = "prev_diag_item" },
        { key = "[c", action = "prev_git_item" },
        { key = "]e", action = "next_diag_item" },
        { key = "]c", action = "next_git_item" },
        { key = "{", action = "dir_up" },
        { key = "s", action = "system_open" },
        { key = "f", action = "live_filter" },
        { key = "F", action = "clear_live_filter" },
        { key = "q", action = "close" },
        { key = "W", action = "collapse_all" },
        { key = "E", action = "expand_all" },
        { key = "S", action = "search_node" },
        { key = ".", action = "run_file_command" },
        { key = "K", action = "toggle_file_info" },
        { key = "g?", action = "toggle_help" },
        -- { key = "m", action = "toggle_mark" },
        -- { key = "bmv", action = "bulk_move" },
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "no",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "▶",
          open = "▼",
          empty = "▷",
          empty_open = "▽",
          symlink = "▶",
          symlink_open = "▼",
        },
        git = {
          unstaged = icons.git.unstaged,
          staged = icons.git.staged,
          unmerged = icons.git.unmerged,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          deleted = icons.git.deleted,
          ignored = icons.git.ignored,
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
  hijack_directories = {
    enable = false,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = true,
      restrict_above_cwd = false,
    },
    file_popup = {
      open_win_config = {
        col = 0,
        row = 1,
        relative = "cursor",
        border = "single",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "incline", "fidget" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash -F",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
})

local api = require("nvim-tree.api")
local Event = require("nvim-tree.api").events.Event
api.events.subscribe(Event.FileCreated, function(data)
  vim.api.nvim_command("NvimTreeRefresh")
  find_file.fn(data.fname)
end)
api.events.subscribe(Event.FolderCreated, function(data)
  vim.api.nvim_command("NvimTreeRefresh")
  find_file.fn(data.folder_name)
end)

-- vim.cmd([[highlight NvimTreeOpenedFile ctermfg=175 guifg=#d3869b]])

-- vim.cmd([[ highlight link NvimTreeLspDiagnosticsError       DiagnosticSignError ]])
-- vim.cmd([[ highlight link NvimTreeLspDiagnosticsWarning     DiagnosticSignWarn ]])
-- vim.cmd([[ highlight link NvimTreeLspDiagnosticsInformation DiagnosticSignInfo ]])
-- vim.cmd([[ highlight link NvimTreeLspDiagnosticsHint        DiagnosticSignHint ]])

vim.keymap.set("n", "<space>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<space>E", "<cmd>NvimTreeFindFile<cr>")

-- vim: foldmethod=marker
