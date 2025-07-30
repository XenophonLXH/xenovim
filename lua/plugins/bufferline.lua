return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                numbers = "ordinal",
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or ""
                    return " " .. icon .. count
                end,
                max_name_length = 30,
                max_prefix_length = 15,
                truncate_names = false,
                tab_size = 30,
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                separator_style = "thin",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                indicator = {
                    icon = '  =>',
                    style = 'icon',
                },
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                offsets = {
                    {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                    }
                }
            }
        })
    end,
}
