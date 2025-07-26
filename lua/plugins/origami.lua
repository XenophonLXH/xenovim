return {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {}, -- needed even when using default config
    tag = "v1.9",

    -- recommended: disable vim's auto-folding
    init = function()
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
    end,

    config = function()
        require("origami").setup {
            -- features incompatible with `nvim-ufo`
            useLspFoldsWithTreesitterFallback = not package.loaded["ufo"],
            autoFold = {
                enabled = false,
                kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
            },
            foldtextWithLineCount = {
                enabled = not package.loaded["ufo"],
                template = "   %s lines", -- `%s` gets the number of folded lines
                hlgroupForCount = "Comment",
            },

            -- can be used with or without `nvim-ufo`
            pauseFoldsOnSearch = true,
            foldKeymaps = {
                setup = true, -- modifies `h` and `l`
                hOnlyOpensOnFirstColumn = false,
            },

            -- features requiring `nvim-ufo`
            keepFoldsAcrossSessions = package.loaded["ufo"],
        }
    end,
}
