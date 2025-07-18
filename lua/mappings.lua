require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "¬", "|") -- To help with typing | on UK layouts
map("n", "<leader>ca", ":%y+<CR>", { desc = "yank the entire buffer" })
map("i", "##", "\\") -- To help with typing \ on UK layouts

map("n", "0", "^", { noremap = true, silent = true }) -- ^ has preferred behaviour over 0
map("n", "^", "0") -- Map ^ to 0 in case.

map("n", "<C-x>", "<Nop>")
map("n", "<C-a>", "<Nop>")

-- Debugger mappings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add a breakpoint on the current line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or resume the debugger" })

-- LSP Suggestion menu
map("n", "<leader>sa", function()
    require("tiny-code-action").code_action()
end, { desc = "Suggestion menu" })

-- Force reload config
map("n", "<leader>rr", "<cmd>luafile %<cr>", { desc = "Reload config" })

map("n", "<leader>td", "<cmd>TodoQuickFix<cr>", { desc = "Open to-do list" })
