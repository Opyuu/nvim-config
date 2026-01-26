local languages = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "c",
    "cpp",
    "haskell",
    "java",
    "python",
    "rust",
}

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup{
            ensure_installed = languages,
            highlight = { enable = true },
            incremental_selection = { enable = true },
	        textobjects = { enable = true },
        }

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
