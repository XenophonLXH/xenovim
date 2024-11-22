# xenovim
Xenophon Neovim configuration

Xenophon's version of Neovim and it's wonderful plugins.

Feel free to clone/fork the repo and make it your own.

# Plugins used
### Package Manager
* Packer: https://github.com/wbthomason/packer.nvim
### UI
* Catpuccin: https://github.com/catppuccin/nvim
* Lualine: https://github.com/nvim-lualine/lualine.nvim
* Notify: https://github.com/rcarriga/nvim-notify
* Colorizer: https://github.com/ggandor/leap.nvim
### Navigation
* Harpoon: https://github.com/ThePrimeagen/harpoon
* Leap: https://github.com/ggandor/leap.nvim
### Searching
* Telescope: https://github.com/nvim-telescope/telescope.nvim
### File Manager
* Neo Tree: https://github.com/nvim-neo-tree/neo-tree.nvim
### Terminal
* ToggleTerm: https://github.com/akinsho/toggleterm.nvim
### Tools
* Tree Sitter: https://github.com/tree-sitter/tree-sitter
* Wakatime: https://github.com/wakatime/vim-wakatime
* Smart Splitter: https://github.com/mrjones2014/smart-splits.nvim
* Vim-Commentary: https://github.com/tpope/Vim-Commentary
* Snippets: https://github.com/L3MON4D3/LuaSnip
* Indent-Blankline: https://github.com/lukas-reineke/indent-blankline.nvim
* Mini-Nvim: https://github.com/echasnovski/mini.nvim
* VimBeGood: https://github.com/ThePrimeagen/vim-be-good
### Git
* LazyGit: https://github.com/jesseduffield/lazygit
### LSP
* LSP-Zero: https://github.com/VonHeikemen/lsp-zero.nvim

# Configuration
## Base configuration
1. *Leader*: `<space>`

### Base Key-bindings
1. `<C-s>` : Save current file (:w)
2. `<C-q>` : Close current file (:q)

## NeoTree
Tree viewer/manager for Neovim

### Key-bindings:
1. `<C-o>`: Open file tree and focus on current open file
2. `<C-e>`: Toggle file tree

## ToggleTerm
Toggle terminal in NVIM. Currently set to *float*

### Key-bindings:
1. `<C-t>` : Open terminal (floating)

## Wakatime
Track your development time

## SmartSplitter
Easily manage multiple windows in a
cyclic motion

### Key-bindings:
1. Resize keys: `h, j, k, l`
2. `<A-h>` : Move to left window
3. `<A-j>` : Move to top window
4. `<A-k>` : Move to bottom window
5. `<A-l>` : Move to right window

## Vim-Commentary
Easily comment out any you like

### Key-bindings:
1. `gcc` : Comment out a line
2. `gc` : Comment out the target of a motion
