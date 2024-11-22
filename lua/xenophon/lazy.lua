-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


return require('lazy').setup({

    -- Theme: Monokai Pro
    "loctvl842/monokai-pro.nvim",
    -- Treesitter
    'nvim-treesitter/playground',
    -- Terminal: ToggleTerm
    "akinsho/toggleterm.nvim",
    -- Time Tracking: Wakatime
    "wakatime/vim-wakatime",
    -- Window Management: Smart Splits
    "mrjones2014/smart-splits.nvim",
    -- Code Commenting: commentary.nvim
    "tpope/vim-commentary",
     -- Code: Indent Animations
    'echasnovski/mini.indentscope',
    'echasnovski/mini.nvim',
    -- VIMBEGOOD
    "ThePrimeagen/vim-be-good",
    -- Leap
    "ggandor/leap.nvim",
    -- CSS Colour
    "norcalli/nvim-colorizer.lua",
    -- use { "ap/vim-css-color" }
    -- Git Blame
    "APZelos/blamer.nvim",
    -- Yuck (Used for Eww Widgets)
    "elkowar/yuck.vim",
    -- Mini.ai (vim motions)
    'echasnovski/mini.ai',

    -- NeoTree: Tree Like Filesystem browser
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },

    -- Mason
    {
        "williamboman/mason.nvim",
        opts = {
            "debugpy",
        }
    },

    -- Telescope: Fuzzy Finder
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },


    -- Theme: TreeSitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true  })
        end,
        dependencies =  { "nvim-treesitter/nvim-treesitter-textobjects" }

    },

    -- LSP Server
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',             -- Required
            'williamboman/mason.nvim',           -- Optional
            'williamboman/mason-lspconfig.nvim', -- Optional

            -- Autocompletion
            'hrsh7th/nvim-cmp',         -- Required
            'hrsh7th/cmp-nvim-lsp',     -- Required
            'hrsh7th/cmp-buffer',       -- Optional
            'hrsh7th/cmp-path',         -- Optional
            'saadparwaiz1/cmp_luasnip', -- Optional
            'hrsh7th/cmp-nvim-lua',     -- Optional

            -- Snippets
            'L3MON4D3/LuaSnip',             -- Required
            'rafamadriz/friendly-snippets', -- Optional
        }

    },

    -- UI: Lualine
    {
        "nvim-lualine/lualine.nvim",
         dependencies = {
             "kyazdani42/nvim-web-devicons", opt = true
         }
    },

    -- UI: nvim-notify
    {
        'rcarriga/nvim-notify',
        config = function ()
          require("notify").setup({
            stages = 'fade_in_slide_out',
            background_colour = '#000000',
            timeout = 3000,
          })
          vim.notify = require('notify')
        end,
    },

     -- Code: indent-blankline.nvim
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
        }
    },

    -- Motion F/f T/tag
    {
        "ggandor/flit.nvim",
        dependencies = {
            { "ggandor/leap.nvim" },
            { "tpope/vim-repeat" }
        }
    },

    -- dap
    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            { "nvim-neotest/nvim-nio" },
            { "mfussenegger/nvim-dap" },
            { "rcarriga/nvim-dap-ui" },
        }
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            { "mfussenegger/nvim-dap" },
        }
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
})
