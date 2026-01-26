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


-- Annoying QOL fixes
vim.opt.fillchars:append { eob = " " }
vim.opt.signcolumn = "yes" -- prevents text shifting


require("config.mappings")
require("config.lazy")

