return {
  "ibhagwan/fzf-lua",
  enabled = false,
  dependencies = {
    -- "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  opts = {
    winopts = {
      border = vim.o.winborder,
      height = 0.8,
      width = 0.8,
      row = 0.5,
      preview = {
        vertical = "down:50%", -- up|down:size
        horizontal = "right:50%",
      },
    },
    lsp = {
      symbols = {
        symbol_icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = " ",
          Interface = " ",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = " ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = " ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      },
    },
  },
  keys = {
    { "<space>ff", "<cmd>FzfLua files<cr>", desc = "FZF - Files" },
    {
      "<space>fF",
      function()
        require("fzf-lua").files({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "FZF - Files Relative Path",
    },
    {
      "<space><space>ff",
      function()
        require("fzf-lua").files({ cmd = "find ." })
      end,
      desc = "FZF - Files [find]",
    },
    { "<space>fo", "<cmd>FzfLua oldfiles<cr>", desc = "FZF - Files History" },
    {
      "<space>fb",
      function()
        require("fzf-lua").buffers({
          filename_only = true,
          fzf_opts = { ["--wrap"] = true },
        })
      end,
      desc = "FZF - Buffers",
    },
    {
      "<space>fB",
      function()
        require("fzf-lua").buffers({
          filename_only = true,
          fzf_opts = { ["--wrap"] = true },
          cwd = vim.fn.expand("%:p:h"),
        })
      end,
      desc = "FZF - Buffers Relative Path",
    },
    { "<space><space>fbl", "<cmd>FzfLua blines<cr>", desc = "FZF - Current Buffer Lines" },
    { "<space><space>fbL", "<cmd>FzfLua lines<cr>", desc = "FZF - Open Buffers Lines" },
    { "<space>fr", "<cmd>FzfLua live_grep<cr>", desc = "FZF - Grep" },
    { "<space>fr", "<cmd>FzfLua grep_visual<cr>", desc = "FZF - Grep", mode = { "x" } },
    { "<space>fR", "<cmd>FzfLua grep_cword<cr>", desc = "FZF - Grep" },
    { "<space>fk", "<cmd>FzfLua keymaps<cr>", desc = "FZF - Key Mappings" },
    { "<space>fm", "<cmd>FzfLua marks<cr>", desc = "FZF - Key Mappings" },
    { "<space>fc", "<cmd>FzfLua commands<cr>", desc = "FZF - Commands" },
    { "<space>fT", "<cmd>FzfLua tabs<cr>", desc = "FZF - Tabs" },

    { "<space>fgf", "<cmd>FzfLua git_files<cr>", desc = "FZF - Git Files" },
    { "<space>fgs", "<cmd>FzfLua git_status<cr>", desc = "FZF - Git Status" },
    {
      "<space>fgS",
      function()
        local current_buffer = vim.api.nvim_buf_get_name(0)
        local buffer_dir = vim.fn.fnamemodify(current_buffer, ":p:h")

        -- Change to the buffer directory and execute the git command
        local git_root = vim.fn.systemlist("cd " .. buffer_dir .. " && git rev-parse --show-toplevel")[1]
        require("fzf-lua").git_status({ cwd = git_root })
      end,
      desc = "FZF - Git Status",
    },
    { "<space>fgc", "<cmd>FzfLua git_commits<cr>", desc = "FZF - Git Commit (Project)" },
    { "<space>fgC", "<cmd>FzfLua git_bcommits<cr>", desc = "FZF - Git Commit (Buffer)" },
    { "<space>fgb", "<cmd>FzfLua git_branches<cr>", desc = "FZF - Git Branches" },
    { "<space>fgt", "<cmd>FzfLua git_stash<cr>", desc = "FZF - Git Stash" },
    { "<space>fls", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "FZF - LSP Document Symbols" },
    { "<space>flS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "FZF - LSP Workspace Symbols" },
    { "<space>fld", "<cmd>FzfLua diagnostics_document<cr>", desc = "FZF - Document Diagnostics" },
    { "<space>flD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "FZF - Document Workspace" },
  },
}
