REQUIRED_LSPS = { "html-lsp", "wc-language-server", "glsl_analyzer", "jdtls", "basedpyright", "lemminx", "rust-analyzer", "lua-language-server", "clangd", "tsgo" }

local config = function()
    local navic = require("nvim-navic")

    for _, server in ipairs(REQUIRED_LSPS) do
        vim.lsp.config(server, {
            on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end
        })
        vim.lsp.enable(server)
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end


return {
    "neovim/nvim-lspconfig",
    config = config,
    opts = {
        inlay_hints = { enabled = true }
    }
}
