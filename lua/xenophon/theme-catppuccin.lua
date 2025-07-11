local my_flavour = 'frappe'
vim.g.catppuccin_flavour = my_flavour -- latte, frappe, macchiato, mocha

-- local my_colors_palette = require('catppuccin.palettes').get_palette(my_flavour)
require('catppuccin').setup({
  -- See big comment in integrations.virtual_text below
  no_italic = true,
  no_underline = true,
  transparent_background = true,
  styles = {
    comments = {},
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      -- At some update, things like "alias" and "echo" in shell scripts
      -- became italic. TSHighlightCapturesUnderCursor told me those things
      -- were styled with @function.call and @function.builtin, but changing
      -- these styles did nothing. So I added no_italic = true to force
      -- no italic. But I can still get italic with it by manually changing
      -- some things to italic. So I decided to manually set some styles to
      -- have italic. Setting italic here in does not work with no_italic option
      -- set to true. To do it, I call a big vim.cmd where I call good old
      -- vimscript's hi <NameOfTheGroup> gui=italic. The groups are:
      -- DiagnosticVirtualTextError
      -- DiagnosticVirtualTextHint
      -- DiagnosticVirtualTextInfo
      -- DiagnosticVirtualTextOk
      -- DiagnosticVirtualTextWarn
      virtual_text = { -- TLDR, these are doing nothing becaus of no_italic.
        errors = { 'italic' },  -- I am setting italic on DiagnosticVirtual
        hints = { 'italic' },   -- manually at the end of the file
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
    cmp = false,
    telescope = true,
    nvimtree = true,
  },
  custom_highlights = function(colors)
    local custom_highlights_table = {
      CursorLine = { bg = '#3a3b3c' },
      ColorColumn = { bg = '#4e4e4e' },
      -- TabLineFill = { bg = '#bbc2cf', fg = 'black' },
      -- WinSeparator = { bg = '#bbc2cf' },
      -- Pmenu = { bg = '#090d24' },
      -- NormalFloat = { bg = '#090d24' },
      Visual = { bg = '#61677d', style = { 'bold' } },
      HighlightOnYank = { bg = '#71778d' }, -- see settings for this

      CursorLineNr = { fg = '#e2e209' },
      SignColumn = { fg = '#a8a8a8' },
      LineNr = { fg = '#8a8a8a' },
      Comment = { fg = '#aaaaaa' },
      Todo = { fg='#aaaaaa', bg='none', style = { 'bold' } },
      NonText = { fg = '#729ecb', style = { 'bold' } },
      VertSplit = { fg = 'NONE', style = { 'reverse' } },
      StatusLine = { fg = 'NONE', style = { 'bold', 'reverse' } },
      StatusLineNC = { fg = 'NONE', style = { 'reverse' } },
      MoreMsg = { fg = 'SeaGreen', style = { 'bold' } },
      MatchParen = { fg = '#87ff00', style = { 'bold' } },

      -- Search       = { fg='#c6d0f5', bg='#506373' },
      -- CurSearch    = { fg='#506373', bg='#c6d0f5' },
      diffChanged = { fg='#e5c890' }
    }
    -- if vim.bo.filetype == 'elixir' then
    --   local my_colors_palette = require('catppuccin.palettes').get_palette(my_flavour)
    --   custom_highlights_table['@function'] = { fg = my_colors_palette.yellow }
    --   custom_highlights_table['@method']   = { fg = my_colors_palette.yellow }
    --   custom_highlights_table['@type']     = { fg = my_colors_palette.blue }
    -- end
    return custom_highlights_table
  end,
})

vim.cmd.colorscheme('catppuccin')
-- vim.o.winborder = "rounded"

vim.cmd([[
hi clear EndOfBuffer
hi link EndOfBuffer NonText
hi clear MsgSeparator
hi link MsgSeparator StatusLine
match CustomTabs /\t/
hi CustomTabs guifg=#999999 gui=NONE
match CustomTrailingWhiteSpaces /\s\+$/
hi link CustomTrailingWhiteSpaces NonText
" Setting ['@parameter'] = { style = {} } would clear
" everything else and leave it without colors
hi @parameter gui=NONE cterm=NONE
hi @namespace gui=NONE cterm=NONE

hi clear @text.uri
hi link @text.uri @comment
hi @text.uri gui=ITALIC cterm=ITALIC
hi clear @string.special.url
hi link @string.special.url @text.uri

hi clear @module
hi link @module Type

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

" hi @text.uri guifg=#CCCCCC gui=NONE cterm=NONE
" hi clear @nospell
" hi link @nospell @text.uri

" One day I woke up and go files looked like shit.
" Function call likes "fmt.Println" and builtins like "make"
" all had the same color as numbers, orange, and types are yellow.
" Everything looked like shit. They used to be blue, just like
" function declarations. So that's why I linked them to @function.
hi clear @method.call
hi link @method.call @function
" hi clear @function.builtin
" hi link @function.builtin @function
" Actually, I think builtin really were orange

hi clear @module
hi link @module Type

" I don't want to use after/syntax/elixir.vim to change these
" because I only want to do it when using catppuccin
" hi link elixirAlias @type
" hi link elixirExUnitAssert elixirFunctionDeclaration
" hi link elixirFunctionDeclaration @function

" hi DiffAdd    guibg=NONE
" hi DiffChange guibg=NONE
" hi DiffDelete guibg=NONE
" hi DiffText   guibg=NONE

hi Folded guibg=#101010

hi DiagnosticVirtualTextError    gui=ITALIC cterm=ITALIC
hi DiagnosticVirtualTextHint     gui=ITALIC cterm=ITALIC
hi DiagnosticVirtualTextInfo     gui=ITALIC cterm=ITALIC
hi DiagnosticVirtualTextOk       gui=ITALIC cterm=ITALIC
hi DiagnosticVirtualTextTextWarn gui=ITALIC cterm=ITALIC
]])
vim.cmd([[hi Cursor guibg=red]])
vim.cmd([[set guicursor=n-v-c:block-Cursor/lCursor]])
