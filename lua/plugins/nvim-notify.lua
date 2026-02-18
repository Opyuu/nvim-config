return {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
        require("notify").setup {
            background_colour = "#000000",
        }
        vim.notify = require "notify"
        vim.keymap.set("n", "<leader>n", "<cmd>Telescope notify<CR>", { desc = "Open notification history" })
    end,
}
