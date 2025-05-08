-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "svelte", "ts_ls", "glsl_analyzer" }
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
        "--clang-tidy",
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

lspconfig.java_language_server.setup {
    capabilities = nvlsp.capabilities,
}
