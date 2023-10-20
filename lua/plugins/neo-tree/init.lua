return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  branch = "main",
  -- branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    { "s1n7ax/nvim-window-picker", name = "window-picker" },
  },
  config = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    -- require("neo-tree.ui.inputs").confirm = function(message, callback)
    --   callback(vim.fn.confirm(message, "&Yes\n&No") == 1)
    -- end
    -- require("neo-tree.ui.inputs").input = function(message, default_value, callback, options, completion)
    --   local input
    --   if completion then
    --     input = vim.fn.input(message .. " ", default_value or "", completion)
    --   else
    --     input = vim.fn.input(message .. " ", default_value or "")
    --   end
    --   callback(input)
    -- end

    -- require("plugins.neo-tree.custom")

    local defaults = require("config.defaults")
    local fold_commands = require("plugins.neo-tree.fold-commands")
    local commands = require("plugins.neo-tree.commands")

    local icons = require("config.icons")

    require("neo-tree").setup({
      source_selector = {
        winbar = false,
        statusline = false,
      },
      close_if_last_window = true,
      hide_root_node = false,
      popup_border_style = defaults.border,
      enable_diagnostics = false,
      use_default_mappings = true,
      use_popups_for_input = false,
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          padding = 0,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
          default = "",
        },
        git_status = {
          symbols = {
            added = "A",
            modified = "M",
            deleted = "D",
            renamed = "R",
            untracked = "?",
            ignored = "!",
            unstaged = "U",
            staged = "S",
            conflict = "C",
          },
        },
      },
      renderers = {
        message = {
          { "indent", with_markers = true },
          { "name",   highlight = "NeoTreeMessage" },
        },
      },
      window = {
        position = "left",
        width = 40,
        same_level = true, -- Create and paste/move files/directories on the same level as the directory under cursor (as opposed to within the directory under cursor).
        insert_as = "sibling",
        mappings = {
          ["<cr>"] = "open",
          ["S"] = "none",
          ["v"] = "none",
          ["s"] = "none",
          ["t"] = "none",
          ["<c-v>"] = "vsplit_with_window_picker",
          ["<c-s>"] = "split_with_window_picker",
          ["<c-t>"] = "open_tabnew",
          ["z"] = "none",
          ["zo"] = fold_commands.neotree_zo,
          ["zO"] = fold_commands.neotree_zO,
          ["zc"] = fold_commands.neotree_zc,
          ["zC"] = fold_commands.neotree_zC,
          ["za"] = fold_commands.neotree_za,
          ["zA"] = fold_commands.neotree_zA,
          ["zx"] = fold_commands.neotree_zx,
          ["zX"] = fold_commands.neotree_zX,
          ["zm"] = fold_commands.neotree_zm,
          ["zM"] = fold_commands.neotree_zM,
          ["zr"] = fold_commands.neotree_zr,
          ["zR"] = fold_commands.neotree_zR,
          ["P"] = { "toggle_preview", config = { use_float = false } },
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,           -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false,   -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        use_libuv_file_watcher = true,
        scan_mode = "deep",
        hide_dotfiles = false,
        window = {
          mappings = {
            ["S"] = "system_open",
            ["K"] = "print_file_name",
            ["/"] = "none",
            ["F"] = "fuzzy_finder",
          },
        },
        commands = {
          print_file_name = commands.print_file_name,
          system_open = commands.system_open,
          trash = commands.trash,
          trash_visual = commands.trash_visual,
        },
      },
      event_handlers = {
        -- {
        --   event = "neo_tree_window_before_open",
        --   handler = function(args) end,
        -- },
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
        -- {
        --   event = "neo_tree_window_before_close",
        --   handler = function(args)
        --     require("neo-tree").setup(getOptions(vim.fn.winwidth(0)))
        --   end,
        -- },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
      },
    })

    vim.keymap.set("n", "<space>e", "<cmd>Neotree toggle=true<cr>")
    vim.keymap.set("n", "<space>E", "<cmd>Neotree reveal<cr>")
  end,
}
