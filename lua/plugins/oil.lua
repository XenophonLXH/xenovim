return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("oil").setup({
            default_file_explorer = false,
            use_default_keymaps = false,
            view_options = {
                show_hidden = true, -- Show hidden files
                show_parent_dir = true, -- Show parent directory
            },
            keymaps = {
                ["<CR>"] = "actions.select",
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["P"] = "actions.preview",
                ["-"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },
                ["."] = { "actions.cd", mode = "n" },
            },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
