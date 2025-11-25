return {
    "rcarriga/nvim-notify",
    config = function(_, opts)
        require('notify').setup(vim.tbl_extend('keep', {
            -- other stuff
            background_colour = "#000000",
            fps = 144
        }, opts))
        vim.notify = require('notify')
    end
}
