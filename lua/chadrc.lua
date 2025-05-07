-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "github_dark",

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },

        -- Operators 
        Operator = { fg = "#60A498" },
        ["@operator"] = { fg = "#60A498" },
        ["@punctuation.delimiter"] = { fg = "#60A498" },
        ["@tag.delimiter"] = { fg = "#60A498" },

        -- Keywords
        Keyword = { fg = "#7BF8E1", bold = true },
        ["@keyword"] = { fg = "#7BF8E1", bold = true },
        ["@keyword.repeat"] = { fg = "#7BF8E1", bold = true },
        ["@keyword.conditional"] = { fg = "#7BF8E1", bold = true },
        ["@keyword.return"] = { fg = "#7BF8E1", bold = true },
        ["@type.builtin"] = { fg = "#7BF8E1" },
        ["@variable.builtin"] = { fg = "#7BF8E1", bold = true },
        ["Boolean"] = { fg = "#7BF8E1", bold = true },

        -- Function calls & constructors & overloads
        Function = { fg = "#FF9CEA" },
        ["@function"] = { fg = "#FF9CEA" },
        ["@function.method"] = { fg = "#FF9CEA" },
        ["@function.call"] = { fg = "#FF9CEA" },
        ["@constructor"] = { fg = "#FF9CEA" },

        -- Punctuation
        ["@punctuation.bracket"] = { fg = "white", bold = true },

        -- Literals
        ["@string"] = { fg = "#B5F6BA" },
        ["@number"] = { fg = "#86DBFD" },

        -- Modules & namespaces
        ["@module"] = { fg = "#F6E9CB" },
        ["Type"] = { fg = "#FFEE12"},

        -- Variables
        ["@constant"] = { fg = "#86DBFD", bold = true },
        ["@variable.parameter"] = { fg = "#ff7f8d" },
    },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
