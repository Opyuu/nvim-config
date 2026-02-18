local palette = require "miku.palette"

local options = {
    icons_enabled = true,
    theme = {
        normal = {
            a = { fg = palette.white, bg = palette.translucentBg },
            b = { bg = palette.translucentBg },
            c = { bg = palette.translucentBg },
        },
    },
    component_separators = { left = "", right = "" },
    section_separators = { left = "│", right = "│" },
    disabled_filetypes = {
        statusline = {},
        winbar = {"NvimTree"},
    },
    ignore_focus = {"NvimTree"},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
        statusline = 10,
        tabline = 10,
        winbar = 10,
        refresh_time = 16, -- ~60fps
        events = {
            "WinEnter",
            "BufEnter",
            "BufWritePost",
            "SessionLoadPost",
            "FileChangedShellPost",
            "VimResized",
            "Filetype",
            "CursorMoved",
            "CursorMovedI",
            "ModeChanged",
        },
    },
}

return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup {
            options = options,
        }
    end,
}
