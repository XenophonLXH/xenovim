return {
    "rcarriga/nvim-notify",
    config = function(_, opts)
        vim.notify = require('notify').setup(vim.tbl_extend('keep', {
            -- other stuff
            background_colour = "#000000"
        }, opts))
    end
}
