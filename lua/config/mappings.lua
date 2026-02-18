vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- This is set in eyeliner
-- vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

vim.keymap.set("n", "0", "^", { noremap = true, silent = true })
vim.keymap.set("n", "^", "0")

vim.keymap.set("n", "<C-x>", "<Nop>")
vim.keymap.set("n", "<C-a>", "<Nop>")
vim.keymap.set("n", "J", "<Nop>") -- This stupid join line thing really pisses me off


vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comments", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "Toggle comments (visual mode)", remap = true })

vim.keymap.set("n", "<leader>ca", ":%y+<CR>", { desc = "Yank the entire buffer into unnamedplus" })

vim.keymap.set("n", "<leader>sa", function()
    require("tiny-code-action").code_action()
end, { desc = "Open suggestions menu" })

-- Plugins
vim.keymap.set("n", "<leader>fm", function ()
    require("conform").format{ lsp_fallback = true }    
end)
