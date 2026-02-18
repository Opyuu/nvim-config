REQUIRED_FORMATTERS = {
    "stylua",
    "prettier",
    "clang-format",
    "checkstyle",
}

return {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            css = { "prettier" },
            html = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            cpp = { "clang-format" },
            java = { "checkstyle" },
        },
    },
}
