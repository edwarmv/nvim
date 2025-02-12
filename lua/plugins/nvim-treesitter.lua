return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
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
      "dap_repl",
      "angular",
      "astro",
      "rust",
      "xml",
    },
    additional_vim_regex_highlighting = {},
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
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
    matchup = {
      enable = true,
      disable_virtual_text = true,
      enable_quotes = true,
      include_match_words = true,
    },
  },
}
