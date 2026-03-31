return {
    "Mofiqul/vscode.nvim",
    lazy = true,
    config = function()
        require("vscode").setup({
            transparent = true,
            italic_comments = false,
            terminal_colors = true,
        })
    end,
}
