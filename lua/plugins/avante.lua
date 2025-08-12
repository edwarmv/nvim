return {
  "yetone/avante.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {
    provider = "gpt-oss",
    providers = {
      ["gpt-oss"] = {
        __inherited_from = "openai",
        endpoint = "http://localhost:1234/v1",
        model = "openai/gpt-oss-20b",
        extra_request_body = {
          max_completion_tokens = 4096,
          max_tokens = 4096,
        },
      },
    },
    hints = { enabled = false },
  },
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}
