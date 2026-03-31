return {
    "ravibrock/spellwarn.nvim",
    event = "VeryLazy",
    config = function()
        require("spellwarn").setup({
            event = { "CursorHold", "CursorHoldI" },
            ft_config = {
                text     = "spellbad",
                markdown = "spellbad",
                gitcommit = "spellbad",
            },
            ft_default = nil, -- don't enable for all filetypes
        })
    end,
}
