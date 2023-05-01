return {
  "ibhagwan/fzf-lua",
  branch = "main",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    winopts = {
      border = "single",
      height = 0.9,
      width = 0.9,
      preview = {
        horizontal = "right:50%",
        border = "noborder",
      },
      hl = { border = "FloatBorder", title = "FloatTitle" },
    },
    file_icon_padding = " ",
    lsp = {
      symbols = {
        symbol_icons = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "",
          Variable = "",
          Class = "",
          Interface = "",
          Module = "",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
          Null = "󰟢",
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
    { "<space>fb", "<cmd>FzfLua buffers<cr>", desc = "FZF - Buffers" },
    {
      "<space>fB",
      function()
        require("fzf-lua").buffers({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "FZF - Buffers Relative Path",
    },
    { "<space>fr", "<cmd>FzfLua live_grep<cr>", desc = "FZF - Grep" },
    { "<space>fk", "<cmd>FzfLua keymaps<cr>", desc = "FZF - Key Mappings" },
    { "<space>fm", "<cmd>FzfLua marks<cr>", desc = "FZF - Key Mappings" },
    { "<space>fc", "<cmd>FzfLua commands<cr>", desc = "FZF - Commands" },

    { "<space>fgf", "<cmd>FzfLua git_files<cr>", desc = "FZF - Git Files" },
    { "<space>fgs", "<cmd>FzfLua git_status<cr>", desc = "FZF - Git Status" },
    { "<space>fgc", "<cmd>FzfLua git_commits<cr>", desc = "FZF - Git Commit (Project)" },
    { "<space>fgC", "<cmd>FzfLua git_bcommits<cr>", desc = "FZF - Git Commit (Buffer)" },
    { "<space>fgb", "<cmd>FzfLua git_branches<cr>", desc = "FZF - Git Branches" },
    { "<space>fgS", "<cmd>FzfLua git_stash<cr>", desc = "FZF - Git Stash" },

    { "<space>fls", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "FZF - LSP Document Symbols" },
    { "<space>flS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "FZF - LSP Workspace Symbols" },
    { "<space>fld", "<cmd>FzfLua diagnostics_document<cr>", desc = "FZF - Document Diagnostics" },
    { "<space>flD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "FZF - Document Workspace" },
  },
}
