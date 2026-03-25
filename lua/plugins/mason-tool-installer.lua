require("plugins.nvim-lspconfig")
require("plugins.conform")

local function concat(a, b)
    local res = {}
    for i = 1, #a do res[#res + 1] = a[i] end
    for i = 1, #b do res[#res + 1] = b[i] end
    return res
end

return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
        ensure_installed = concat(REQUIRED_FORMATTERS, REQUIRED_MASON_LSPS)
    }
}
