return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            use_default_keymaps = false,
            view_options = {
                show_hidden = true, -- Show hidden files
                show_parent_dir = true, -- Show parent directory
                is_always_hidden = function(name, bufnr)
                    return name == "__pycache__"
                end,
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

        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "oil://*",
            once = true,
            callback = function()
                local dir = require("oil").get_current_dir()
                if dir then
                    vim.cmd("cd " .. vim.fn.fnameescape(dir))
                end
            end,
        })
    end,
}
