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

-- Rounded corners! Keep the main Lazy window rounded but strip the backdrop border.
vim.opt.winborder = "rounded"
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lazy",
    callback = function()
        -- Run slightly later so both Lazy windows exist.
        vim.schedule(function()
            local columns, lines = vim.o.columns, vim.o.lines
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                local cfg = vim.api.nvim_win_get_config(win)
                if cfg.relative ~= "" then
                    -- Treat the nearly full-screen backdrop as borderless.
                    if cfg.width and cfg.height and cfg.width >= columns - 2 and cfg.height >= lines - 2 then
                        pcall(vim.api.nvim_win_set_config, win, { border = "none" })
                    else
                        pcall(vim.api.nvim_win_set_config, win, { border = "rounded" })
                    end
                end
            end
        end)
    end,
})

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
vim.opt.showmode = false
vim.opt.cmdheight = 0

-- The one terminal issue
local function SaveAndExit()
    vim.api.nvim_command ":wa"
    vim.api.nvim_command ":qa"
end

vim.api.nvim_create_user_command("Wqa", SaveAndExit, {})
vim.api.nvim_set_keymap("c", "wqa", "Wqa", { noremap = true, silent = false })

require "config.mappings"
require "config.lazy"
