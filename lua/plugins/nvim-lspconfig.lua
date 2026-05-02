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

    local function safe_hover(opts)
        local params = vim.lsp.util.make_position_params(0, "utf-8")
        vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result)
            if err or not (result and result.contents) then
                return
            end

            local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
            lines = vim.lsp.util.trim_empty_lines(lines)
            if vim.tbl_isempty(lines) then
                return
            end

            local float_opts = vim.tbl_extend("force", { border = "rounded" }, opts or {})
            -- Render markdown syntax, but bypass markdown TS stylize (conceal_line crash path).
            local had_syntax_on = vim.g.syntax_on
            vim.g.syntax_on = nil
            local ok, preview_or_err, winid = pcall(vim.lsp.util.open_floating_preview, lines, "markdown", float_opts)
            vim.g.syntax_on = had_syntax_on

            if not ok then
                vim.notify("Hover preview failed: " .. tostring(preview_or_err), vim.log.levels.WARN)
                return
            end

            return preview_or_err, winid
        end)
    end

    local default_server_config = {
        on_attach = function(client, bufnr)
            if client.server_capabilities and client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
            end
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

    vim.keymap.set("n", "K", function()
        safe_hover { focusable = true }
    end, { desc = "Show hover documentation" })

    vim.keymap.set("n", "<C-k>", function()
        vim.lsp.buf.signature_help { border = "rounded" }
    end, { desc = "Show signature help" })

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
