local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes



hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#FFFFFF" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

--
-- local highlight = {
--     "RainbowRed",
--     "RainbowYellow",
--     "RainbowBlue",
--     "RainbowOrange",
--     "RainbowGreen",
--     "RainbowViolet",
--     "RainbowCyan",
-- }
--
-- local hooks = require "ibl.hooks"
-- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- every time the colorscheme changes
--
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#d3dbe3" })
--     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E06C75" })
--     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)
--
-- require("ibl").setup {
--     scope = {
--         highlight = highlight,
--         show_start = true,
--         show_end = true,
--         include = {
--             node_type = {
--                 lua = {
--                     "block",
--                     "if_statement",
--                     "else_statement",
--                     "elseif_statement",
--                     "for_statement",
--                     "while_statement",
--                     "repeat_statement",
--                     "function_definition",
--                     "do_statement",
--                     "table_constructor",
--                     "return_statement",
--                     "arguments",
--                 },
--
--                 -- C++ scope definitions
--                 cpp = {
--                     "compound_statement",
--                     "if_statement",
--                     "else_statement",
--                     "for_statement",
--                     "while_statement",
--                     "do_statement",
--                     "function_definition",
--                     "lambda_expression",
--                     "struct_specifier",
--                     -- "namespace_definition",
--                     "try_statement",
--                     "catch_clause",
--                     "switch_statement",
--                     "initializer_list",
--                 },
--             },
--         },
--     },
-- }
--
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
