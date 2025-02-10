local defaults = require("config.defaults")
local icons = defaults.icons

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "b0o/nvim-tree-preview.lua",
    "s1n7ax/nvim-window-picker",
  },
  config = function()
    local preview = require("nvim-tree-preview")

    require("nvim-tree").setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        -- local treeutils = require("plugins.nvim-tree.treeutils")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        -- vim.keymap.set("n", "<leader>tf", treeutils.launch_find_files, opts("Launch Find Files"))
        -- vim.keymap.set("n", "<leader>tg", treeutils.launch_live_grep, opts("Launch Live Grep"))
        -- vim.keymap.set("n", "<leader>td", treeutils.find_directory_and_focus, opts("Focus Directory With Telescope"))

        vim.keymap.del("n", "<C-]>", { buffer = bufnr })
        vim.keymap.del("n", "<C-x>", { buffer = bufnr })
        vim.keymap.del("n", "-", { buffer = bufnr })
        vim.keymap.del("n", "<BS>", { buffer = bufnr })
        vim.keymap.del("n", "f", { buffer = bufnr })
        vim.keymap.del("n", "F", { buffer = bufnr })
        vim.keymap.del("n", "<c-k>", { buffer = bufnr })

        vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        vim.keymap.set("n", "K", api.tree.change_root_to_parent, opts("Up"))
        vim.keymap.set("n", "J", api.tree.change_root_to_node, opts("CD"))

        vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
        vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))

        vim.keymap.set("n", "<Tab>", preview.node_under_cursor, opts("Preview"))
      end,
      actions = {
        open_file = {
          window_picker = {
            picker = require("window-picker").pick_window,
          },
        },
      },
      view = {
        width = {
          min = function()
            local width = math.floor(vim.o.columns * 0.2)
            return width
          end,
          max = -1,
          padding = 0,
        },
        signcolumn = "yes",
        side = "right",
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
      hijack_cursor = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = icons.diagnostics.hint,
          info = icons.diagnostics.info,
          warning = icons.diagnostics.warn,
          error = icons.diagnostics.error,
        },
      },
      update_focused_file = {
        enable = true,
      },
      hijack_netrw = true,
      hijack_directories = {
        enable = true,
      },
      modified = {
        enable = true,
      },
      filters = {
        git_ignored = false,
      },
    })

    local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
    vim.api.nvim_create_autocmd("User", {
      pattern = "NvimTreeSetup",
      callback = function()
        local events = require("nvim-tree.api").events
        events.subscribe(events.Event.NodeRenamed, function(data)
          if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
            data = data
            Snacks.rename.on_rename_file(data.old_name, data.new_name)
          end
        end)
      end,
    })
  end,
  keys = {
    {
      "<space>e",
      function()
        require("nvim-tree.api").tree.toggle({
          find_file = false,
          focus = true,
          update_root = false,
        })
      end,
      desc = "NvimTree - Toggle",
    },
    {
      "<space>E",
      function()
        require("nvim-tree.api").tree.find_file({
          open = true,
          focus = true,
        })
      end,
      desc = "NvimTree - FindFile",
    },
  },
}
