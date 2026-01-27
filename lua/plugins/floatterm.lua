
return {
    "Opyuu/floaterm",
    dependencies = {"nvzone/volt"},
    event = "BufEnter",
    config = function ()
        require("floaterm").setup{
            border = "rounded"
        }

        vim.keymap.set({"n", "t"}, "<A-i>", require("floaterm").toggle, { desc = "Open floating terminal" })
    end
}

