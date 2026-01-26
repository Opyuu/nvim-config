-- Terminal integration
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

-- Line numbers (relative)
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true


-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.conceallevel = 2


-- Shell
vim.opt.shell = "fish"


-- Annoying QOL fixes
vim.opt.fillchars:append { eob = " " }
vim.opt.signcolumn = "yes" -- prevents text shifting

-- The one terminal issue
local function SaveAndExit()
	vim.api.nvim_command(":wa")
	vim.api.nvim_command(":qa")
end

vim.api.nvim_create_user_command("Wqa", SaveAndExit, {})
vim.api.nvim_set_keymap("c", "wqa", "Wqa", { noremap = true, silent = false })


require("config.mappings")
require("config.lazy")

