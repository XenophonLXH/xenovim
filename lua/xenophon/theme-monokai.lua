-- Set Color Scheme
vim.o.termguicolors = true

-- vim.api.guicursor = "guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50"

-- Set Background to Clear
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

require("monokai-pro").setup({
  transparent_background = true,
  -- transparent_background = false,
  terminal_colors = true,
  devicons = true, -- highlight the icons of `nvim-web-devicons`
  styles = {
    comment = { italic = true },
    keyword = { italic = true }, -- any other keyword
    type = { italic = true }, -- (preferred) int, long, char, etc
    storageclass = { italic = true }, -- static, register, volatile, etc
    structure = { italic = true }, -- struct, union, enum, etc
    parameter = { italic = true }, -- parameter pass in function
    annotation = { italic = true },
    tag_attribute = { italic = true }, -- attribute of tag in reactjs
  },
  filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
  -- Enable this will disable filter option
  day_night = {
    enable = true, -- turn off by default
    day_filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
    night_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  },
  inc_search = "background", -- underline | background
  background_clear = {
    "float_win",
    "toggleterm",
    "telescope",
    "which-key",
    "renamer",
    "notify",
    "nvim-tree",
    "neo-tree",
    "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
  },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
      context_start_underline = false,
    },
  },
  overridePalette = function(filter)
      return {
        -- dark2 = "#101014",
        -- dark1 = "#16161E",
        -- background = "#1A1B26",
        -- text = "#C0CAF5",
        -- accent1 = "#f7768e",
        -- accent2 = "#7aa2f7",
        -- accent3 = "#e0af68",
        -- accent4 = "#9ece6a",
        -- accent5 = "#0DB9D7",
        -- accent6 = "#9d7cd8",
        -- dimmed1 = "#737aa2",
        -- dimmed2 = "#787c99",
        -- dimmed3 = "#363b54",
        -- dimmed4 = "#363b54",
        -- dimmed5 = "#16161e",
      }
    end,
  -- overrideScheme = function(cs, p, config, hp)
  --     local cs_override = {}
  --     local calc_bg = hp.blend(p.background, 0.95, '#000000')

  --     cs_override.editor = {
  --       background = calc_bg,
  --     }
  --     return cs_override
  --   end
  })
-- lua
vim.cmd([[colorscheme monokai-pro]])
vim.cmd([[hi Cursor guibg=red]])
vim.cmd([[set guicursor=n-v-c:block-Cursor/lCursor]])
-- vim.api.guicursor = "guicursor=n-v-c:block-Cursor/lCursor"
