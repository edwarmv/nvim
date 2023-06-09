return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local function multiopen(prompt_bufnr, method)
      local edit_file_cmd_map = {
        vertical = "vsplit",
        horizontal = "split",
        tab = "tabedit",
        default = "edit",
      }
      local edit_buf_cmd_map = {
        vertical = "vert sbuffer",
        horizontal = "sbuffer",
        tab = "tab sbuffer",
        default = "buffer",
      }
      local picker = action_state.get_current_picker(prompt_bufnr)
      local multi_selection = picker:get_multi_selection()

      if #multi_selection > 1 then
        require("telescope.pickers").on_close_prompt(prompt_bufnr)
        pcall(vim.api.nvim_set_current_win, picker.original_win_id)

        for i, entry in ipairs(multi_selection) do
          local filename, row, col

          if entry.path or entry.filename then
            filename = entry.path or entry.filename

            row = entry.row or entry.lnum
            col = vim.F.if_nil(entry.col, 1)
          elseif not entry.bufnr then
            local value = entry.value
            if not value then
              return
            end

            if type(value) == "table" then
              value = entry.display
            end

            local sections = vim.split(value, ":")

            filename = sections[1]
            row = tonumber(sections[2])
            col = tonumber(sections[3])
          end

          local entry_bufnr = entry.bufnr

          if entry_bufnr then
            if not vim.api.nvim_buf_get_option(entry_bufnr, "buflisted") then
              vim.api.nvim_buf_set_option(entry_bufnr, "buflisted", true)
            end
            local command = i == 1 and "buffer" or edit_buf_cmd_map[method]
            pcall(vim.cmd, string.format("%s %s", command, vim.api.nvim_buf_get_name(entry_bufnr)))
          else
            local command = i == 1 and "edit" or edit_file_cmd_map[method]
            if vim.api.nvim_buf_get_name(0) ~= filename or command ~= "edit" then
              filename = require("plenary.path"):new(vim.fn.fnameescape(filename)):normalize(vim.loop.cwd())
              pcall(vim.cmd, string.format("%s %s", command, filename))
            end
          end

          if row and col then
            pcall(vim.api.nvim_win_set_cursor, 0, { row, col - 1 })
          end
        end
      else
        actions["select_" .. method](prompt_bufnr)
      end
    end

    local custom_actions = transform_mod({
      multi_selection_open_vertical = function(prompt_bufnr)
        multiopen(prompt_bufnr, "vertical")
      end,
      multi_selection_open_horizontal = function(prompt_bufnr)
        multiopen(prompt_bufnr, "horizontal")
      end,
      multi_selection_open_tab = function(prompt_bufnr)
        multiopen(prompt_bufnr, "tab")
      end,
      multi_selection_open = function(prompt_bufnr)
        multiopen(prompt_bufnr, "default")
      end,
    })

    local function stopinsert(callback)
      return function(prompt_bufnr)
        vim.cmd.stopinsert()
        vim.schedule(function()
          callback(prompt_bufnr)
        end)
      end
    end
    local fb_actions = require("telescope").extensions.file_browser.actions
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key",
            ["<C-x>"] = false,
            -- ["<C-v>"] = stopinsert(custom_actions.multi_selection_open_vertical),
            -- ["<C-s>"] = stopinsert(custom_actions.multi_selection_open_horizontal),
            -- ["<C-t>"] = stopinsert(custom_actions.multi_selection_open_tab),
            -- ["<CR>"] = stopinsert(custom_actions.multi_selection_open),
          },
          n = {
            ["<C-x>"] = false,
            -- ["<C-v>"] = custom_actions.multi_selection_open_vertical,
            -- ["<C-s>"] = custom_actions.multi_selection_open_horizontal,
            -- ["<C-t>"] = custom_actions.multi_selection_open_tab,
            -- ["<CR>"] = custom_actions.multi_selection_open,
          },
        },
        prompt_prefix = "> ",
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
          bottom_pane = {
            height = 25,
            preview_cutoff = 120,
            prompt_position = "top",
          },
          center = {
            height = 0.5,
            preview_cutoff = 40,
            prompt_position = "top",
            width = 0.5,
          },
          cursor = {
            height = 0.9,
            preview_cutoff = 40,
            width = 0.9,
          },
          horizontal = {
            height = 0.9,
            preview_cutoff = 120,
            prompt_position = "top",
            width = 0.9,
          },
          vertical = {
            height = 0.9,
            preview_cutoff = 40,
            prompt_position = "top",
            width = 0.9,
          },
        },
        -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        workspaces = {
          -- keep insert mode after selection in the picker, default is false
          keep_insert = false,
        },
        file_browser = {
          mappings = {
            n = {
              ["<S-CR>"] = false,
              ["<M-a>"] = fb_actions.create_from_prompt,
            },
            i = {
              ["<S-CR>"] = false,
              ["<M-a>"] = fb_actions.create_from_prompt,
            },
          },
        },
      },
    })

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("fzf")
  end,
  keys = {
    { "<space>tld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Telescope - Diagnostics Document" },
    { "<space>tlD", "<cmd>Telescope diagnostics<cr>", desc = "Telescope - Diagnostics Workspace" },
    { "<space>tls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Telescope - LSP Document Symbols" },
    { "<space>tlS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Telescope - LSP Workspace Symbols" },
    { "<space>tlr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope - LSP References" },
    { "<space>tli", "<cmd>Telescope lsp_implementations<cr>", desc = "Telescope - LSP Implementation" },
    { "<space>tLd", "<cmd>Telescope lsp_definitions<cr>", desc = "Telescope - LSP Definitions" },
    { "<space>tLc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Telescope - LSP Incoming calls" },
    { "<space>tLC", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "Telescope - LSP Outcoming calls" },

    { "<space>tr", "<cmd>Telescope live_grep<cr>", desc = "Telescope - Live Grep" },
    { "<space>tR", "<cmd>Telescope grep_string<cr>", desc = "Telescope - Live Grep Under Cursor" },
    { "<space>tf", "<cmd>Telescope find_files<cr>", desc = "Telescope - Find Files" },
    {
      "<space>tF",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Telescope - Relative Find Files",
    },
    { "<space>to", "<cmd>Telescope oldfiles<cr>", desc = "Telescope - Old Files" },
    { "<space>tb", "<cmd>Telescope buffers<cr>", desc = "Telescope - Buffers" },
    { "<space>Tb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope - Current Buffer Fuzzy Find" },
    {
      "<space>tB",
      function()
        require("telescope.builtin").buffers({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Telescope - Relative Buffers",
    },
    { "<space>tk", "<cmd>Telescope keymaps<cr>", desc = "Telescope - Keymaps" },
    { "<space>tc", "<cmd>Telescope commands<cr>", desc = "Telescope - Commands" },
    { "<space>tm", "<cmd>Telescope marks<cr>", desc = "Telescope - Commands" },

    { "<space>Tf", "<cmd>Telescope file_browser<cr>", desc = "Telescope - File Manager" },
    { "<space>TF", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Telescope - File Manager" },

    { "<space>tgc", "<cmd>Telescope git_commits<cr>", desc = "Telescope - Git Commits" },
    { "<space>tgC", "<cmd>Telescope git_bcommits<cr>", desc = "Telescope - Git Buffer's Commits" },
    { "<space>tgb", "<cmd>Telescope git_branches<cr>", desc = "Telescope - Git Branches" },
    { "<space>tgs", "<cmd>Telescope git_status<cr>", desc = "Telescope - Git Status" },
    { "<space>tgS", "<cmd>Telescope git_stash<cr>", desc = "Telescope - Git Stash" },
  },
}
