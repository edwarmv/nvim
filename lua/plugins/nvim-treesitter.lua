return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/playground",
    },
  },
  main = "nvim-treesitter.configs",
  opts = {
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
      -- "norg",
      -- "norg_meta",
      -- "norg_table",
    },
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = {
      enable = true,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
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
