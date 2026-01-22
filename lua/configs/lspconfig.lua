-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "svelte", "ts_ls", "glsl_analyzer", "jdtls", "basedpyright", "lemminx", "rust_analyzer" }
local nvlsp = require "nvchad.configs.lspconfig"


for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

lspconfig.clangd.setup {
    capabilities = nvlsp.capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--enable-config",
        "--clang-tidy",
        "--log=verbose",
    },
    init_options = {
        fallbackFlags = {
            "-Wno-unused-variable",
            "-Wno-shadow",
            "-Wshadow-field-in-constructor-modified",
            "-Wshadow-ivar",
            "-Wno-implicit-function-declaration",
            "-Wno-switch",
            "-Wno-parentheses",
            "-Wbitwise-op-parentheses",
            "-Wdangling-else",
            "-Wlogical-not-parentheses",
            "-Wlogical-op-parentheses",
            "-Woverloaded-shift-op-parentheses",
            "-Wparentheses-equality",
            "-Wshift-op-parentheses",
        },
    },
}

vim.diagnostic.config {
    virtual_text = false,
    -- signs = false,
    -- underline = false,
    -- update_in_insert = false,
}

lspconfig.harper_ls.setup{
    settings = {
        ["harper-ls"] = {
            dialect = "British"
        }
    }
}
