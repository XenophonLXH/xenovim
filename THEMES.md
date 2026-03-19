Two steps:

  1. Create lua/plugins/<themename>.lua with the plugin spec:
  return {
      "author/repo.nvim",
      lazy = true,
      config = function()
          require("themename").setup({ transparent = true })
      end,
  }

  2. Add an entry to M.themes in lua/utils/theme_switcher.lua:
  { name = "themename", plugin = "repo.nvim", display = "Pretty Name", post = post_common },

  - name — the string you pass to vim.cmd.colorscheme()
  - plugin — the last part of the GitHub repo (what lazy.nvim uses internally), e.g. "repo.nvim"
  - display — what appears in the <leader>ct picker
  - post — use post_common unless the theme needs special highlight overrides (like oxocarbon did for transparency)

  Then run :Lazy sync to install.
