return {
    "ribru17/bamboo.nvim",
    lazy = true,
    config = function()
        require("bamboo").setup({
            transparent_background = true,
            italic_comment = false,
        })
    end,
}
