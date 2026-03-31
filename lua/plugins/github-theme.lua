return {
    "projekt0n/github-nvim-theme",
    lazy = true,
    config = function()
        require("github-theme").setup({
            options = {
                transparent = true,
                styles = {
                    comments = "NONE",
                    keywords = "NONE",
                    functions = "NONE",
                    variables = "NONE",
                },
            },
        })
    end,
}
