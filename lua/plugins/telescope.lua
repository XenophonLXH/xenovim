return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_config = {
                width = 0.9,
                height = 200,
                bottom_pane = {
                    height = 25,
                    preview_cutoff = 120,
                    prompt_position = "top"
                },
                center = {
                    height = 0.4,
                    preview_cutoff = 40,
                    prompt_position = "top",
                    width = 0.5
                },
                cursor = {
                    height = 0.9,
                    preview_cutoff = 40,
                    width = 0.8
                },
                horizontal = {
                    height = 0.9,
                    preview_cutoff = 120,
                    prompt_position = "bottom",
                    width = 0.8
                },
                vertical = {
                    anchor = "center",
                    height = 0.99,
                    preview_height = 0.65,
                    preview_cutoff = 40,
                    prompt_position = "top",
                    width = 0.9
                }
                },
                layout_strategy = "vertical",
                file_ignore_patterns = {
                "node_modules",
                "*.po",
                "%.po",
                },
            },
        })
    end,
}
