local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP manager
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    -- Vscode-like pictograms
        {
                "onsails/lspkind.nvim",
                event = { "VimEnter" },
        },
        -- Auto-completion engine
        {
                "hrsh7th/nvim-cmp",
                dependencies = {
                        "lspkind.nvim",
                        "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
                        "hrsh7th/cmp-buffer", -- buffer auto-completion
                        "hrsh7th/cmp-path", -- path auto-completion
                        "hrsh7th/cmp-cmdline", -- cmdline auto-completion
                },
                config = function()
                        require("config.nvim-cmp")
                end,
        },
        -- Code snippet engine
        {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
        },
    "tanvirtin/monokai.nvim",
    {
        "ray-x/go.nvim",
        dependencies = {  -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
        require("go").setup()
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        'Exafunction/codeium.vim',
        config = function ()
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    },
    {
                "folke/noice.nvim",
                event = "VeryLazy",
                opts = {
                        -- add any options here
                },
                dependencies = {
                        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                        "MunifTanjim/nui.nvim",
                        -- OPTIONAL:
                        --   `nvim-notify` is only needed, if you want to use the notification view.
                        --   If not available, we use `mini` as the fallback
                        "rcarriga/nvim-notify",
                },
        },
    -- Git integration
        "tpope/vim-fugitive",
    -- Git decorations
        {
                "lewis6991/gitsigns.nvim",
                -- config = function()
                --      require("config.gitsigns")
                -- end,
        },
    -- Autopairs: [], (), "", '', etc
        {
                "windwp/nvim-autopairs",
                event = "InsertEnter",
                -- config = function()
                --      require("config.nvim-autopairs")
                -- end,
        },
    -- Treesitter-integration
        {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                -- config = function()
                --      require("config.nvim-treesitter")
                -- end,
        },
        -- Nvim-treesitter text objects
        {
                "nvim-treesitter/nvim-treesitter-textobjects",
                dependencies = "nvim-treesitter/nvim-treesitter",
                -- config = function()
                --      require("config.nvim-treesitter-textobjects")
                -- end,
        },
        -- Show indentation and blankline
        {
                "lukas-reineke/indent-blankline.nvim",
                main = "ibl",
                -- config = function()
                --      require("config.indent-blankline")
                -- end,
        },
        -- Status line
        {
                "nvim-lualine/lualine.nvim",
                dependencies = { "nvim-tree/nvim-web-devicons" },
                -- config = function()
                --      require("config.lualine")
                -- end,
        },
    -- Markdown support
        { "preservim/vim-markdown", ft = { "markdown" } },
        -- Markdown previewer
        {
                "iamcco/markdown-preview.nvim",
                cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
                ft = { "markdown" },
                build = function()
                        vim.fn["mkdp#util#install"]()
                end,
        },
        -- File explorer
        {
                "nvim-tree/nvim-tree.lua",
                dependencies = {
                        "nvim-tree/nvim-web-devicons", -- optional, for file icons
                },
                -- config = function()
                --      require("config.nvim-tree")
                -- end,
        },
    -- Better terminal integration
        {
                "akinsho/toggleterm.nvim",
                version = "*",
                -- config = function()
                --       require("config.toggleterm")
                -- end,
        },
    -- Fuzzy finder
        {
                "nvim-telescope/telescope.nvim",
                branch = "0.1.x",
                dependencies = { "nvim-lua/plenary.nvim" },
                -- config = function()
                --      require("config.telescope")
                -- end,
        },
    {
                "folke/trouble.nvim",
                branch = "dev",
                dependencies = { "nvim-tree/nvim-web-devicons" },
                keys = {
                        {
                                "<leader>xx",
                                "<cmd>Trouble diagnostics toggle<cr>",
                                desc = "Diagnostics (Trouble)",
                        },
                        {
                                "<leader>xX",
                                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                                desc = "Buffer Diagnostics (Trouble)",
                        },
                        {
                                "<leader>cs",
                                "<cmd>Trouble symbols toggle focus=false<cr>",
                                desc = "Symbols (Trouble)",
                        },
                        {
                                "<leader>cl",
                                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                                desc = "LSP Definitions / references / ... (Trouble)",
                        },
                        {
                                "<leader>xL",
                                "<cmd>Trouble loclist toggle<cr>",
                                desc = "Location List (Trouble)",
                        },
                        {
                                "<leader>xQ",
                                "<cmd>Trouble qflist toggle<cr>",
                                desc = "Quickfix List (Trouble)",
                        },
                },
                -- opts = function()
                --      require("config.trouble")
                -- end,
        },
        {
            "junegunn/fzf",
            dir = "~/.fzf",
            build = "./install --all",
        },
})
