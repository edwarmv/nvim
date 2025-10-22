return {
  "jake-stewart/multicursor.nvim",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Align cursor columns.
    set("n", "<leader><leader>a", mc.alignCursors)

    -- Add a cursor for all matches of cursor word/selection in the document.
    set({ "n", "x" }, "<leader><leader>A", mc.matchAllAddCursors)

    -- Add or skip cursor above/below the main cursor.
    set({ "n", "x" }, "<up>", function()
      mc.lineAddCursor(-1)
    end)
    set({ "n", "x" }, "<down>", function()
      mc.lineAddCursor(1)
    end)
    set({ "n", "x" }, "<s-up>", function()
      mc.lineSkipCursor(-1)
    end)
    set({ "n", "x" }, "<s-down>", function()
      mc.lineSkipCursor(1)
    end)

    -- Add or skip adding a new cursor by matching word/selection
    set({ "n", "x" }, "<c-n>", function()
      mc.matchAddCursor(1)
    end)
    set({ "n", "x" }, "<m-c-n>", function()
      mc.matchSkipCursor(1)
    end)
    set({ "n", "x" }, "<c-p>", function()
      mc.matchAddCursor(-1)
    end)
    set({ "n", "x" }, "<m-c-p>", function()
      mc.matchSkipCursor(-1)
    end)

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)

    -- Disable and enable cursors.
    -- set({ "n", "x" }, "<c-q>", mc.toggleCursor)

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, "<left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<right>", mc.nextCursor)

      -- Delete the main cursor.
      -- layerSet({ "n", "x" }, "<leader>mx", mc.deleteCursor)

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { link = "Cursor" })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
