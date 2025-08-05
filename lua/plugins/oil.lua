return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("oil").setup({
            default_file_explorer = false,
            view_options = {
                show_hidden = true, -- Show hidden files
                show_parent_dir = true, -- Show parent directory
            },
            keymaps = {
            },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
