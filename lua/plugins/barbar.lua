return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("barbar").setup {
            icons = {
                separator = { left = "│", right = "" },
            },
            sidebar_filetypes = {
                NvimTree = true,
            },
            hightlight_visible = false
        }
        vim.api.nvim_set_hl(0, "BufferTabpageFill", { bg = "NONE" })

        -- I'm effectively trying to preserve a browser's tab movement keys, except we hold alt with everything.
        vim.keymap.set({ "n", "i" }, "<A-,>", "<cmd>BufferPrevious<CR>", { desc = "Previous tab" })
        vim.keymap.set({ "n", "i" }, "<A-.>", "<cmd>BufferNext<CR>", { desc = "Next tab" })
        vim.keymap.set("n", "<tab>", "<cmd>BufferNext<CR>", { desc = "Next tab" })
        vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", { desc = "Previous tab" })
        vim.keymap.set("n", "<A-p>", "<cmd>BufferPin<CR>", { desc = "Pin tab" })
        vim.keymap.set("n", "<A-w>", "<cmd>BufferClose<CR>", { desc = "Close tab" })
        vim.keymap.set("n", "<A-t>", "<cmd>BufferRestore<CR>", { desc = "Restore tab" })

        vim.keymap.set("n", "<A-<>", "<cmd>BufferMovePrevious", { desc = "Move tab to left" })
        vim.keymap.set("n", "<A->>", "<cmd>BufferMoveNext", { desc = "Move tab to right" })

        for i = 1, 9 do
            vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", {
                silent = true,
                desc = "Go to buffer " .. i,
            })
        end

        vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", {
            silent = true,
            desc = "Go to last buffer",
        })

        -- TODO: https://github.com/romgrk/barbar.nvim?ref=poltora.dev highlight groups
    end,
}
