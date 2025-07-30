return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "main",
  },
  { "nvim-treesitter/nvim-treesitter-context", opts = {} },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      auto_install = true,
      ensure_installed = {
        "cpp",
        "graphql",
        "typescript",
        "javascript",
        "jsdoc",
        "tsx",
        "java",
        "css",
        "scss",
        "json",
        "jsonc",
        "json5",
        "yaml",
        "http",
        "html",
        "lua",
        "fish",
        "comment",
        "vim",
        "vimdoc",
        "bash",
        "regex",
        "markdown",
        "markdown_inline",
        "mermaid",
        "python",
        "sql",
        "gitcommit",
        "gitignore",
        "git_rebase",
        "diff",
        "gitattributes",
        "dockerfile",
        "dart",
        "angular",
        "astro",
        "rust",
        "xml",
      },
      highlight = {
        enable = true,
        disable = function(ctx)
          local buf = ctx.buf
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

          return ok and stats and stats.size > max_filesize
        end,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    },
  },
}
