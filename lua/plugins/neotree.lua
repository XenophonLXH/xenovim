return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- Neotree: Browse the file system and other tree like structures in whatever
        -- style we want
        local components = require('neo-tree.sources.common.components')
        require("neo-tree").setup({

            -- Close if it is the last window
            close_if_last_window = true,

            -- Look And Feel
            popup_border_style = "rounded",

            -- Sorting
            sort_case_insensitive = false,
            -- sort_function = nil,

            -- Git
            enable_git_status = true,

            -- Diagnostics
            enable_diagnostics = true,


            default_component_configs = {
                container = {
                    enable_character_fade = true
                },
                indent = {
                    indent_size = 2,
                    padding = 1, -- extra padding on left hand side
                    -- indent guides
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    highlight = "NeoTreeIndentMarker",
                    -- expander config, needed for nesting files
                    with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                    -- then these will never be used.
                    default = "*",
                    highlight = "NeoTreeFileIcon"
                },
                modified = {
                    symbol = "[+]",
                    highlight = "NeoTreeModified",
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted   = "✖",-- this can only be used in the git_status source
                        renamed   = "R",-- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "-",
                        staged    = "",
                        conflict  = "",
                    }
                },
            },
            window = {
                position = "left",
                width = 35,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    ["<space>"] = { 
                        "toggle_node", 
                        --nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
                    },
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    ["<esc>"] = "revert_preview",
                    ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false} },
                    ["l"] = "focus_preview",
                    ["S"] = "open_split",
                    ["s"] = "open_vsplit",
                    -- ["S"] = "split_with_window_picker",
                    -- ["s"] = "vsplit_with_window_picker",
                    ["t"] = "open_tabnew",
                    -- ["<cr>"] = "open_drop",
                    -- ["t"] = "open_tab_drop",
                    ["w"] = "open_with_window_picker",
                    --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
                    ["C"] = "close_node",
                    ["z"] = "close_all_nodes",
                    --["Z"] = "expand_all_nodes",
                    ["a"] = { 
                        "add",
                        -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                        config = {
                            show_path = "none" -- "none", "relative", "absolute"
                        }
                    },
                    ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                    -- ["c"] = {
                        --  "copy",
                        --  config = {
                            --    show_path = "none" -- "none", "relative", "absolute"
                            --  }
                            --}
                            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                            ["q"] = "close_window",
                            ["R"] = "refresh",
                            ["?"] = "show_help",
                            ["<"] = "prev_source",
                            [">"] = "next_source",
                        }
                    },
                    nesting_rules = {},
                    filesystem = {
                        filtered_items = {
                            visible = false, -- when true, they will just be displayed differently than normal items
                            hide_dotfiles = true,
                            hide_gitignored = true,
                            hide_hidden = true, -- only works on Windows for hidden files/directories
                            hide_by_name = {
                                --"node_modules"
                            },
                            hide_by_pattern = { -- uses glob style patterns
                                --"*.meta",
                                --"*/src/*/tsconfig.json",
                                "*__pycache__*",
                            },
                            always_show = { -- remains visible even if other settings would normally hide it
                                --".gitignored",
                            },
                            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                                --".DS_Store",
                                --"thumbs.db"
                            },
                            never_show_by_pattern = { -- uses glob style patterns
                                --".null-ls_*",
                            },
                        },
                        follow_current_file = {
                            enabled = true, -- This will find and focus the file in the active buffer every
                        },                             -- time the current file is changed while the tree is open.
                        group_empty_dirs = false, -- when true, empty folders will be grouped together
                        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                        -- in whatever position is specified in window.position
                        -- "open_current",  -- netrw disabled, opening a directory opens within the
                        -- window like netrw would, regardless of window.position
                        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
                        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                        -- instead of relying on nvim autocmd events.
                        window = {
                            mappings = {
                                ["F"] = "fuzzy_finder_directory",
                            }
                        },
                        components = {
                            name = function(config, node, state)
                                local name = components.name(config, node, state)
                                if node:get_depth() == 1 then
                                    name.text = vim.fs.basename(vim.loop.cwd() or '')
                                end
                                return name
                            end,
                        },
                    },
                    buffers = {
                        follow_current_file = {
                            true, -- This will find and focus the file in the active buffer every
                        },
                        -- time the current file is changed while the tree is open.
                        group_empty_dirs = true, -- when true, empty folders will be grouped together
                        show_unloaded = true,
                        window = {
                            mappings = {
                                ["."] = "set_root",
                            }
                        }
                    },
                    git_status = {
                        window = {
                            position = "float",
                        }
                    },
                })
            end,
}
