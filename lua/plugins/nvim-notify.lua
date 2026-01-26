return  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
        vim.notify = require("notify")
        vim.keymap.set("n", "<leader>n", "<cmd>Telescope notify<CR>", { desc = "Open notification history" })
    end,
}
