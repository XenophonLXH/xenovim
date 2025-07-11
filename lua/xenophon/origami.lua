-- default settings
require("origami").setup({
    -- features incompatible with `nvim-ufo`
    useLspFoldsWithTreesitterFallback = not package.loaded["ufo"],
    autoFold = {
        enabled = false,
        kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
    },
    foldText = {
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
})
