return {
    "dgox16/oldworld.nvim",
    lazy = true,
    config = function()
        require("oldworld").setup({
            transparent = true,
            italic_comments = false,
        })
    end,
}
