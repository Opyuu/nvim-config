local function on_attach(bufnr)

    -- Defaults available at https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
    local api = require("nvim-tree.api")

    vim.keymap.set("n", "<CR>", api.node.open.edit, { buffer = bufnr, desc = "Open File/Folder" })
    vim.keymap.set("n", "a", api.fs.create, { buffer = bufnr, desc = "Create File/Folder" })
    vim.keymap.set("n", "d", api.fs.remove, { buffer = bufnr, desc = "Delete File/Folder" })
    vim.keymap.set("n", "R", api.fs.rename, { buffer = bufnr, desc = "Rename File/Folder" })
    vim.keymap.set("n", "r", api.fs.rename_basename, { buffer = bufnr, desc = "Rename File (without the extension)" })
    vim.keymap.set("n", "x", api.fs.cut, { buffer = bufnr, desc = "Cut File/Folder" })
    vim.keymap.set("n", "c", api.fs.copy.node, { buffer = bufnr, desc = "Copy File/Folder" })
    vim.keymap.set("n", "p", api.fs.paste, { buffer = bufnr, desc = "Paste File/Folder" })
    vim.keymap.set("n", "w", api.tree.change_root_to_node, { buffer = bufnr, desc = "Focus workspace on Folder" })
    vim.keymap.set("n", "o", api.node.run.system, { buffer = bufnr, desc = "Open file/folder with system application" })
    vim.keymap.set("n", "s", api.tree.search_node, { buffer = bufnr, desc = "Search for file/folder" })
    vim.keymap.set("n", "y", api.fs.copy.filename, { buffer = bufnr, desc = "Copy filename" })
    vim.keymap.set("n", "i", api.tree.toggle_gitignore_filter, { buffer = bufnr, desc = "Toggle GitIgnored files" })
    vim.keymap.set("n", "h", api.tree.toggle_hidden_filter, { buffer = bufnr, desc = "Toggle hidden files" })
    vim.keymap.set("n", "e", api.tree.expand_all, { buffer = bufnr, desc = "Expand all folders" })
    vim.keymap.set("n", "E", api.tree.collapse_all, { buffer = bufnr, desc = "Collapse all folders" })
end


return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup{
            on_attach = on_attach,
            renderer = {
                group_empty = true,
            }
        }

        vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle Nvim Tree" })

        -- TODO: highlight groups
    end,
}
