return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = true },
        },
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "c",
                "cpp",
                "haskell",
                "java",
                "python",
                "rust",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- Your configuration options here (optional)
        },
        event = "VimEnter", -- Load immediately
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
            ensure_installed = {
                "codelldb",
            },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"

            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.after.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "rachartier/tiny-code-action.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },

            -- optional picker via telescope
            { "nvim-telescope/telescope.nvim" },
            -- optional picker via fzf-lua
            { "ibhagwan/fzf-lua" },
            -- .. or via snacks
            {
                "folke/snacks.nvim",
                opts = {
                    terminal = {},
                },
            },
        },
        event = "LspAttach",
        opts = {},
    },
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
    },
    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            vim.notify = require "notify"
        end,
    },
    {
        "unblevable/quick-scope",
        config = function()
            vim.cmd [[
                highlight QuickScopePrimary guifg='#e356a7' gui=bold,underline cterm=bold,underline
                highlight QuickScopeSecondary guifg='#75d7ec' gui=bold,underline cterm=bold,underline
            ]]
        end,
        event = "VimEnter", -- Lazy load on Vim enter
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {
                -- Configuration here, or leave empty to use defaults
            }
        end,
    },
    {
        "NStefan002/screenkey.nvim",
        lazy = false,
        version = "*",
    },
    {
        "edluffy/hologram.nvim",
        config = function()
            require("hologram").setup {
                auto_display = true,
            }
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "configs.rainbow"
        end,
    },
    {
        "Mythos-404/xmake.nvim",
        version = "^3",
        lazy = true,
        event = "BufReadPost",
        config = true,
    },
    -- {
    --     "sontungexpt/better-diagnostic-virtual-text",
    --     event = "LspAttach",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     config = function()
    --         vim.diagnostic.config { virtual_text = false }
    --         local opts = {
    --             ui = {
    --                 wrap_line_after = false,
    --                 left_kept_space = 3,
    --                 right_kept_space = 3,
    --                 arrow = "  ",
    --                 up_arrow = "  ",
    --                 down_arrow = "  ",
    --                 above = true,
    --             },
    --             priority = 2003, -- the priority of virtual text
    --             inline = false,
    --         }
    --         require("better-diagnostic-virtual-text").setup(opts)
    --
    --         vim.diagnostic.enable(true, { bufnr = vim.api.nvim_get_current_buf() }) -- Enable the plugin for the current buffer.
    --         vim.keymap.set("n", "<leader>de", function()
    --             vim.diagnostic.enable(true, { bufnr = vim.api.nvim_get_current_buf() }) -- Enable the plugin for the current buffer.
    --         end, { desc = "Toggle better diagnostics" })
    --     end,
    -- },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            local opts = require "configs.tiny-inline"
            require("tiny-inline-diagnostic").setup(opts)
        end,
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "COMP0009",
                    path = "~/Documents/Vaults/COMP0009",
                },
                {
                    name = "COMP0119",
                    path = "~/Documents/Vaults/COMP0199/",
                },
            },

            -- see below for full list of options 👇
        },
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- Uncomment whichever supported plugin(s) you use
            "nvim-tree/nvim-tree.lua",
            -- "nvim-neo-tree/neo-tree.nvim",
            -- "simonmclean/triptych.nvim"
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<C-,>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        end,
    },
}
