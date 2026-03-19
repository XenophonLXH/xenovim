return {
    "uloco/bluloco.nvim",
    lazy = true,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
        require("bluloco").setup({
            style = "dark",
            transparent = true,
            italic = false,
        })
    end,
}
