return {
    "David-Kunz/gen.nvim",
    config = function()
        require("gen").setup {
            model = "llama3.2",
            host = "localhost",
            port = "11434",
        }
        vim.keymap.set({ "n", "v" }, "<leader>-", ":Gen<CR>")
    end,
}
