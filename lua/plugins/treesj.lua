return     {
    "Wansmer/treesj",
    keys = {
        {
            "<leader>m",
            "<CMD>TSJToggle<CR>",
            desc = "Toggle split/join block",
        },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = {
        use_default_keymaps = false,
        max_join_length = 250,
    },
}
