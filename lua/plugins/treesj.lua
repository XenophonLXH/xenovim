return     {
    "Wansmer/treesj",
    keys = {
        {
            "<leader>m",
            "<CMD>TSJToggle<CR>",
            desc = "Toggle Treesj",
        },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = {
        use_default_keymaps = false,
    },
}
