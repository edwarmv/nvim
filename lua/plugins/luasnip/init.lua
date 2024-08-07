return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "dsznajder/vscode-es7-javascript-react-snippets",
      build = "yarn install --frozen-lockfile && yarn compile",
    },
  },
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    local types = require("luasnip.util.types")
    require("plugins.luasnip.snippets")
    require("luasnip.config").setup({
      history = true,
      update_events = { "TextChanged", "TextChangedI" },
      ext_opts = {
        [types.insertNode] = {
          unvisited = {
            virt_text = { { "•", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
        -- Add this to also have a placeholder in the final tabstop.
        -- See the discussion below for more context.
        [types.exitNode] = {
          unvisited = {
            virt_text = { { "•", "Conceal" } },
            virt_text_pos = "inline",
          },
        },
      },
      -- ext_opts = {
      --   [types.choiceNode] = {
      --     active = {
      --       virt_text = { { "●", "red" } },
      --       hl_mode = "combine",
      --       priority = 1000,
      --     },
      --   },
      --   [types.insertNode] = {
      --     active = {
      --       virt_text = { { "●", "Green" } },
      --       hl_mode = "combine",
      --       priority = 1000,
      --     },
      --   },
      -- },
      -- ext_opts = {
      --   [types.insertNode] = {
      --     active = {
      --       virt_text = { { " ", "CmpItemKindSnippet" } },
      --       priority = 200,
      --     },
      --   },
      -- },
      -- delete_check_events = "InsertLeave",
      -- region_check_events = "InsertEnter"
    })

    -- vim.api.nvim_create_autocmd("InsertLeave", {
    --   callback = function()
    --     if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
    --       and not require("luasnip").session.jump_active then
    --       require("luasnip").unlink_current()
    --     end
    --   end,
    -- })

    -- see: https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1011938524
    -- function leave_snippet()
    --   if
    --     ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
    --     and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
    --     and not require("luasnip").session.jump_active
    --   then
    --     require("luasnip").unlink_current()
    --   end
    -- end

    vim.api.nvim_create_autocmd("ModeChanged", {
      callback = function()
        if
          ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
          and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
          and not require("luasnip").session.jump_active
        then
          require("luasnip").unlink_current()
        end
      end,
    })

    -- stop snippets when you leave to normal mode
    -- vim.api.nvim_command([[
    --     autocmd ModeChanged * lua leave_snippet()
    -- ]])
  end,
}
