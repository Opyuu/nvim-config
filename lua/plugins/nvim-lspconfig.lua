REQUIRED_MASON_LSPS = {
    "html-lsp",
    "wc-language-server",
    "glsl_analyzer",
    "jdtls",
    "basedpyright",
    "lemminx",
    "rust-analyzer",
    "lua-language-server",
    "clangd",
    "tsgo",
    "css-lsp",
    "harper-ls",
}

REQUIRED_LSPCONFIG_SERVERS = {
    "html",
    "wc_language_server",
    "glsl_analyzer",
    "jdtls",
    "basedpyright",
    "lemminx",
    "rust_analyzer",
    "lua_ls",
    "clangd",
    "tsgo",
    "cssls",
    "harper_ls",
}

local config = function()
    local navic = require "nvim-navic"

    local default_server_config = {
        on_attach = function(client, bufnr)
            navic.attach(client, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
    }

    local server_overrides = {
        harper_ls = {
            settings = {
                ["harper-ls"] = {
                    dialect = "British",
                },
            },
        },
    }

    for _, server in ipairs(REQUIRED_LSPCONFIG_SERVERS) do
        local server_config = vim.tbl_deep_extend("force", default_server_config, server_overrides[server] or {})
        vim.lsp.config(server, server_config)
        vim.lsp.enable(server)
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    opts = {
        inlay_hints = { enabled = true },
    },
}
