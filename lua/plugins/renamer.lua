local config = function ()
    local utils = require("renamer.mappings.utils")
    local renamer = require("renamer")

    local rename = function ()
        renamer.rename{ empty = false }
    end

    renamer.setup {
        title = "Rename",
        padding = {
            top = 0,
            left = 1,
            bottom = 0,
            right = 1,
        },
        min_width = 15,
        max_width = 45,
        border = true,
        border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        show_refs = true,
        with_popup = true,
    }

    vim.keymap.set("n", "<leader>ra", rename, { desc = "Rename symbol (LSP) "})
end

return {
    'filipdutescu/renamer.nvim',
    config = config
}
