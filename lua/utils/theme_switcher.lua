local M = {}

local THEME_FILE = vim.fn.stdpath('data') .. '/nvim_theme.txt'

-- Common overrides applied to every theme
local function post_common()
    vim.cmd([[
    hi clear EndOfBuffer
    hi link EndOfBuffer NonText
    match CustomTabs /\t/
    hi CustomTabs guifg=#999999 gui=NONE
    match CustomTrailingWhiteSpaces /\s\+$/
    hi link CustomTrailingWhiteSpaces NonText
    hi @parameter gui=NONE cterm=NONE

    hi clear @module
    hi link @module Type

    hi clear @method.call
    hi link @method.call @function

    hi clear @comment.todo
    hi clear @comment.error
    hi clear @comment.warning
    hi clear @comment.hint
    hi clear @comment.note
    hi @comment.todo    gui=BOLD
    hi @comment.error   gui=BOLD
    hi @comment.warning gui=BOLD
    hi @comment.hint    gui=BOLD
    hi @comment.note    gui=BOLD

    hi DiagnosticVirtualTextError    gui=ITALIC cterm=ITALIC
    hi DiagnosticVirtualTextHint     gui=ITALIC cterm=ITALIC
    hi DiagnosticVirtualTextInfo     gui=ITALIC cterm=ITALIC
    hi DiagnosticVirtualTextOk       gui=ITALIC cterm=ITALIC
    hi DiagnosticVirtualTextTextWarn gui=ITALIC cterm=ITALIC

    hi BufferLineFill           guibg=NONE
    hi BufferLineBackground     guibg=NONE
    hi BufferLineBufferVisible  guibg=NONE
    hi BufferLineBufferSelected guibg=NONE
    ]])
    vim.cmd([[hi Cursor guibg=red]])
    vim.cmd([[set guicursor=n-v-c:block-Cursor/lCursor]])
end

local function post_catppuccin()
    post_common()
    vim.cmd([[
    hi clear MsgSeparator
    hi link MsgSeparator StatusLine
    hi Directory guifg=#BA5F37
    hi @namespace gui=NONE cterm=NONE

    hi clear @text.uri
    hi link @text.uri @comment
    hi @text.uri gui=ITALIC cterm=ITALIC
    hi clear @string.special.url
    hi link @string.special.url @text.uri

    hi Folded guibg=#101010
    ]])
end

local function post_oxocarbon()
    post_common()
    -- oxocarbon doesn't support transparent natively
    vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat",  { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC",     { bg = "none" })
end

-- Each entry:
--   name:    colorscheme name for vim.cmd.colorscheme()
--   plugin:  lazy.nvim plugin name for require('lazy').load()
--   display: shown in the picker
--   post:    optional function run after colorscheme is applied
M.themes = {
    { name = "catppuccin",  plugin = "catppuccin",       display = "Catppuccin Macchiato", post = post_catppuccin },
    { name = "tokyonight",  plugin = "tokyonight.nvim",  display = "Tokyo Night",          post = post_common },
    { name = "gruvbox",     plugin = "gruvbox.nvim",     display = "Gruvbox",              post = post_common },
    { name = "oxocarbon",   plugin = "oxocarbon.nvim",   display = "Nyoom (Oxocarbon)",    post = post_oxocarbon },
    { name = "onedark",     plugin = "onedarkpro.nvim",  display = "One Dark Pro",         post = post_common },
    { name = "vague",       plugin = "vague.nvim",       display = "Vague",                post = post_common },
    { name = "bamboo",      plugin = "bamboo.nvim",      display = "Bamboo",               post = post_common },
    { name = "bluloco",     plugin = "bluloco.nvim",     display = "Bluloco Dark",         post = post_common },
    { name = "oldworld",    plugin = "oldworld.nvim",    display = "Old World",            post = post_common },
    { name = "boo",         plugin = "boo-colorscheme-nvim", display = "Boo",              post = post_common },
    { name = "vscode",      plugin = "vscode.nvim",          display = "VS Code",           post = post_common },
    { name = "shale",       plugin = "shale.nvim",           display = "Shale",             post = post_common },
    { name = "koda",              plugin = "koda.nvim",              display = "Koda",              post = post_common },
    { name = "github_dark_dimmed", plugin = "github-nvim-theme",     display = "GitHub Dark Dimmed", post = post_common },
    { name = "zenbones",          plugin = "zenbones.nvim",          display = "Zenbones",          post = post_common },
    { name = "edge",              plugin = "edge",                   display = "Edge",              post = post_common },
    { name = "nord",              plugin = "nord.nvim",              display = "Nord",              post = post_common },
    { name = "solarized-osaka",   plugin = "solarized-osaka.nvim",   display = "Solarized Osaka",   post = post_common },
    { name = "melange",           plugin = "melange-nvim",           display = "Melange",           post = post_common },
    { name = "xcodedark",         plugin = "vim-colors-xcode",       display = "Xcode Dark",        post = post_common },
    { name = "mellifluous",       plugin = "mellifluous.nvim",       display = "Mellifluous",       post = post_common },
    { name = "lucius",            plugin = "vim-lucius",             display = "Lucius",            post = post_common },
    { name = "kanagawa-paper",    plugin = "kanagawa-paper.nvim",    display = "Kanagawa Paper",    post = post_common },
}

M.apply = function(name)
    local theme = nil
    for _, t in ipairs(M.themes) do
        if t.name == name then theme = t; break end
    end
    if not theme then
        vim.notify("Unknown theme: " .. name, vim.log.levels.ERROR)
        return
    end

    require('lazy').load({ plugins = { theme.plugin } })
    local ok, err = pcall(vim.cmd.colorscheme, name)
    if not ok then
        vim.notify("Failed to apply theme '" .. name .. "': " .. err, vim.log.levels.ERROR)
        return
    end

    if theme.post then theme.post() end
    vim.fn.writefile({ name }, THEME_FILE)
end

M.load_saved = function()
    local ok, lines = pcall(vim.fn.readfile, THEME_FILE)
    if ok and lines and lines[1] and lines[1] ~= '' then
        M.apply(lines[1])
    else
        M.apply('catppuccin')
    end
end

M.pick = function()
    local display_names = {}
    local name_map = {}
    for _, t in ipairs(M.themes) do
        table.insert(display_names, t.display)
        name_map[t.display] = t.name
    end
    vim.ui.select(display_names, { prompt = 'Select Theme' }, function(choice)
        if choice then M.apply(name_map[choice]) end
    end)
end

return M
