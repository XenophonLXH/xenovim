return {
    "oskarnurm/koda.nvim",
    lazy = true,
    config = function()
        require("koda").setup({
            transparent = true,
            cache = true,
        })
    end,
}
