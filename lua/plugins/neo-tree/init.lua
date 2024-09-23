local defaults = require("config.defaults")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      { "s1n7ax/nvim-window-picker", name = "window-picker" },
      -- "saifulapm/neotree-file-nesting-config",
    },
    config = function()
      local fold_commands = require("plugins.neo-tree.fold-commands")
      local commands = require("plugins.neo-tree.commands")

      require("neo-tree").setup({
        -- nesting_rules = require("neotree-file-nesting-config").nesting_rules,
        hide_root_node = true,
        retain_hidden_root_indent = true,
        popup_border_style = defaults.border,
        enable_diagnostics = false,
        use_popups_for_input = true,
        default_component_configs = {
          container = {
            enable_character_fade = true,
          },
          indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            padding = 0,
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
          file_size = {
            enabled = false,
          },
        },
        renderers = {
          message = {
            { "indent", with_markers = true },
            { "name", highlight = "NeoTreeMessage" },
          },
        },
        window = {
          position = "right",
          width = "20%",
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
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["h"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" and node:is_expanded() then
                require("neo-tree.sources.filesystem").toggle_directory(state, node)
              else
                require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
              end
            end,
            ["l"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" then
                if not node:is_expanded() then
                  require("neo-tree.sources.filesystem").toggle_directory(state, node)
                elseif node:has_children() then
                  require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                end
              end
            end,
          },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            show_hidden_count = false,
          },
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          use_libuv_file_watcher = true,
          scan_mode = "deep",
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
          {
            event = "neo_tree_window_after_open",
            handler = function(args)
              vim.opt_local.foldcolumn = "0"
              if args.position == "left" or args.position == "right" then
                vim.cmd("wincmd =")
              end
            end,
          },
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
    end,
    keys = {
      { "<space>e", "<cmd>Neotree toggle=true<cr>", desc = "Neotree Toggle" },
      { "<space>E", "<cmd>Neotree reveal<cr>", desc = "Neotree Reveal" },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    opts = {},
  },
}
