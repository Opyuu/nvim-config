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
    "markdown",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- main doesn't support lazy-loading
    build = ":TSUpdate",
    config = function()
        local ts = require "nvim-treesitter"

        -- Replaces ensure_installed (async; already-installed parsers are skipped)
        ts.install(languages)

        -- Map parser names to filetypes (e.g. vimdoc -> help)
        local filetypes = {}
        for _, lang in ipairs(languages) do
            vim.list_extend(filetypes, vim.treesitter.language.get_filetypes(lang))
        end

        -- Replaces highlight = { enable = true }, plus folds and indent
        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function(args)
                if not pcall(vim.treesitter.start, args.buf) then
                    return
                end
                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
