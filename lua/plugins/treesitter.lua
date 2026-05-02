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
    "markdown"
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup{
            ensure_installed = languages,
            highlight = { enable = true },
            incremental_selection = { enable = true },
	        textobjects = { enable = true },
        }
    end
}
