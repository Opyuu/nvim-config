return {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = "FloatermToggle",
    config = function ()
        vim.keymap.set("n", "<A-i>", require("floaterm").toggle, { desc = "Open floating terminal" })
    end
}          

