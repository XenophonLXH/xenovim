return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_title = false,
                    },
                    width = 0.9,
                    height = 0.85,
                    preview_cutoff = 120,
                },
                sorting_strategy = "ascending",
                file_ignore_patterns = {
                "node_modules",
                "*.po",
                "%.po",
                },
            },
        })
    end,
}
