return {
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            local highlight = {
                "TransBlue",
                "TransPink",
                "TransWhite",
                "TransPink",
                "TransBlue",
            }

            local hooks = require "ibl.hooks"

            vim.g.rainbow_delimiters = { highlight = highlight }
            require("ibl").setup { scope = { highlight = highlight } }
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end,
    },
}
