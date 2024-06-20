return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "b0o/nvim-tree-preview.lua",
    "antosha417/nvim-lsp-file-operations",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local icons = require("config.icons")
    local preview = require("nvim-tree-preview")
    require("lsp-file-operations").setup()

    require("nvim-tree").setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local treeutils = require("plugins.nvim-tree.treeutils")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "<leader>tf", treeutils.launch_find_files, opts("Launch Find Files"))
        vim.keymap.set("n", "<leader>tg", treeutils.launch_live_grep, opts("Launch Live Grep"))
        vim.keymap.set("n", "<leader>td", treeutils.find_directory_and_focus, opts("Focus Directory With Telescope"))

        vim.keymap.del("n", "<C-]>", { buffer = bufnr })
        vim.keymap.del("n", "<C-x>", { buffer = bufnr })
        vim.keymap.del("n", "-", { buffer = bufnr })
        vim.keymap.del("n", "<BS>", { buffer = bufnr })
        vim.keymap.del("n", "f", { buffer = bufnr })
        vim.keymap.del("n", "F", { buffer = bufnr })

        vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        vim.keymap.set("n", "K", api.tree.change_root_to_parent, opts("Up"))
        vim.keymap.set("n", "J", api.tree.change_root_to_node, opts("CD"))

        vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
        vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))

        vim.keymap.set("n", "<Tab>", preview.node_under_cursor, opts("Preview"))
      end,
      view = {
        width = {
          min = 30,
          max = -1,
          padding = 0,
        },
        signcolumn = "yes",
      },
      renderer = {
        root_folder_label = false,
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
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
          git_placement = "after",
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = true,
            picker = function()
              return require("window-picker").pick_window({
                filter_rules = {
                  file_path_contains = { "nvim-tree-preview://" },
                },
              })
            end,
          },
        },
      },
      hijack_cursor = false,
      diagnostics = {
        enable = false,
      },
      update_focused_file = {
        enable = false,
      },
      hijack_directories = {
        enable = false,
      },
      modified = {
        enable = true,
      },
      filters = {
        git_ignored = false,
      },
    })

    vim.keymap.set("n", "<space>e", "<cmd>NvimTreeToggle<cr>", { desc = "NvimTree - Toggle" })
    vim.keymap.set("n", "<space>E", "<cmd>NvimTreeFindFile<cr>", { desc = "NvimTree - FindFile" })
  end,
}
