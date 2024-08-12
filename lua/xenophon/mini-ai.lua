local gen_spec = require('mini.ai').gen_spec
require('mini.ai').setup({
    custom_textobjects = {
      -- Function definition (needs treesitter queries with these captures)
      F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    },

    n_lines = 500,
})
