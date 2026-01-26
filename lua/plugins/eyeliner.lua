local config = function ()
    local eyeliner = require("eyeliner")

    local clear = function ()
        vim.cmd("EyelinerDisable")
        vim.cmd("EyelinerEnable")
    end

    eyeliner.setup{
        highlight_on_key = false,
        dim = true,
        max_length = 9999,

        disabled_filetypes = {"NvimTree", "Terminal"},

        disabled_buftypes = {"nofile"},

        default_keymaps = true,
    }

    vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#e356a7', bold = true, underline = true })
    vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#75d7ec', bold = true, underline = true })
    vim.api.nvim_set_hl(0, "EyelinerDimmed", { fg = "#666666" })

    vim.keymap.set("n", "f", function()
        eyeliner.highlight({ forward = true })
        return "f"
    end, { expr = true })

    vim.keymap.set("n", "F", function()
        eyeliner.highlight({ forward = false })
        return "F"
    end, { expr = true })

    vim.keymap.set("n", "t", function()
        eyeliner.highlight({ forward = true })
        return "t"
    end, { expr = true })

    vim.keymap.set("n", "T", function()
        eyeliner.highlight({ forward = false })
        return "T"
    end, { expr = true })


    vim.keymap.set({"n", "v", "o"}, "<Esc>", function ()
        clear()
        vim.cmd("nohlsearch")
        return "<Esc>"
    end, { expr = true })
end


return {
    "jinh0/eyeliner.nvim",
    event = "VeryLazy",
    config = config
}
