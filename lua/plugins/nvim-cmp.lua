local opts = function()
    local cmp = require("cmp")

    return {
        completion = { completeopt = "menu,menuone" },

        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },

        mapping = {
            ["<CR>"] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },

            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    require("luasnip").expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    require("luasnip").jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "nvim_lua" },
            { name = "async_path" },
        },

        formatting = {
            fields = { "abbr", "kind", "menu" },
            format = function(entry, item)
                -- Truncate long completion items
                local max_width = 50
                if #item.abbr > max_width then
                    item.abbr = item.abbr:sub(1, max_width - 1) .. '...'
                end
                
                return item
            end,
        },

        window = {
            completion = cmp.config.window.bordered{
                border = "rounded",
                max_width = 80,
                max_height = 20,
            },
            documentation = cmp.config.window.bordered{
                border = "rounded"
            },
        }
    }
end


return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "L3MON4D3/LuaSnip",
        { -- Once again from NvChad
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "https://codeberg.org/FelipeLema/cmp-async-path.git",
        }
    },
    opts = opts
}
