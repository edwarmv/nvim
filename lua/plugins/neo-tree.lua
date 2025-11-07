return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      source_selector = {
        winbar = true,
      },
      window = {
        position = "right",
        mappings = {
          ["<C-s>"] = "split_with_window_picker",
          ["<C-v>"] = "vsplit_with_window_picker",
          ["<C-t>"] = "open_tabnew",
          ["s"] = false,
          ["S"] = false,
          ["t"] = false,
          ["z"] = false,
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
          visible = true,
        },
      },
      default_component_configs = {
        name = {
          highlight_opened_files = true,
        },
      },
    },
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle<cr>",
        desc = "Neotree - Toggle",
      },
      {
        "<leader>E",
        "<cmd>Neotree reveal<cr>",
        desc = "Neotree - Reveal",
      },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
