return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "Vaults",
                path = "~/Aurelia/Vaults/",
            },
        },

        -- see below for full list of options 👇
    },
}
