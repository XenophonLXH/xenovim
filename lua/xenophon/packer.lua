-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- NeoTree: Tree Like Filesystem browser
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- Mason
  use {
      "williamboman/mason.nvim",
      opts = {
          "debugpy",
      }
  }

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope: Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Theme: Catppuccin
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "rebelot/kanagawa.nvim" }
  use { "sainnhe/gruvbox-material" }
  use { "bluz71/vim-moonfly-colors" }
  use { "sainnhe/sonokai" }

  -- Theme: TreeSitter
  use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use( 'nvim-treesitter/playground' )

  -- File Management: Harpoon - bookmark files
  use( 'theprimeagen/harpoon' )

  -- LSP Server
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }

 }

 -- Terminal: ToggleTerm
 use { "akinsho/toggleterm.nvim" }

 -- Time Tracking: Wakatime
 use { "wakatime/vim-wakatime" }

 -- Window Management: Smart Splits
 use { "mrjones2014/smart-splits.nvim" }

 -- Code Commenting: commentary.nvim
 use { "tpope/vim-commentary" }

 -- UI: Lualine
 use { "nvim-lualine/lualine.nvim",
     requires = {
         "kyazdani42/nvim-web-devicons", opt = true
     }
 }

 -- UI: nvim-notify
   use {
    'rcarriga/nvim-notify',
    config = function ()
      require("notify").setup({
        stages = 'fade_in_slide_out',
        background_colour = '#000000',
        timeout = 3000,
      })
      vim.notify = require('notify')
    end,
  }

 -- Code: indent-blankline.nvim
    use {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
        }
    }

 -- Code: Indent Animations
    use 'echasnovski/mini.indentscope'
    use 'echasnovski/mini.nvim'

 -- UI: Noice
 -- -- Packer
use({
  "folke/noice.nvim",
  requires = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = {
      lsp = {
          hover = false
      }
  }
})

-- VIMBEGOOD
use { "ThePrimeagen/vim-be-good" }

-- Leap
use { "ggandor/leap.nvim" }

-- CSS Colour
use { "norcalli/nvim-colorizer.lua" }
-- use { "ap/vim-css-color" }

-- Motion F/f T/tag
use { "ggandor/flit.nvim",
    requires = {
        { "ggandor/leap.nvim" },
        { "tpope/vim-repeat" }
    }
}

-- Git Blame
use "APZelos/blamer.nvim"

-- Coc
-- use "neoclide/coc.nvim"

-- dap
use { "mfussenegger/nvim-dap-python",
    requires = {
        { "mfussenegger/nvim-dap" },
        { "rcarriga/nvim-dap-ui" },
    }
}

use { "rcarriga/nvim-dap-ui",
    requires = {
        { "mfussenegger/nvim-dap" },
    }
}

-- Obsidian
use({
  "epwalsh/obsidian.nvim",
  tag = "*",  -- recommended, use latest release instead of latest commit
  requires = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "work",
          path = "/home/xenophon/Documents/Work/ObsidianVault/TaskFlow/",
          overrides = {
              notes_subdir = "notes",
          }
        },
        {
          name = "personal",
          path = "/home/xenophon/Documents/Personal/ObsidianVault/",
          overrides = {
              notes_subdir = "notes",
          }
        },
      },

      -- see below for full list of options 👇
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return suffix
      end,
    })
  end
})

-- Yuck (Used for Eww Widgets)
use { "elkowar/yuck.vim" }

end)
