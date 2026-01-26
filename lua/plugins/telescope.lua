local config = function ()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find file (using Telescope)" })
    vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find word (using grep)" })

    return {
        defaults = {
            prompt_prefix = "   ",
            selection_caret = " ",
            entry_prefix = " ",
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                },
                width = 0.87,
                height = 0.80,
            },
            mappings = {
                n = { ["q"] = require("telescope.actions").close },
            },
        },

        extensions_list = { "themes", "terms", "notify" },
        extensions = {},
    }
end

return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = config,
}
