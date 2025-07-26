return {
    cmd = {
        "odoo-lsp",
    },
    filetypes = {
        'python',
        'xml',
        'javascript',
    },
    root_dir = function(fname)
        return vim.fs.dirname(vim.fs.find({'.git', 'odoo.conf'}, {path = fname, upward = true})[1])
    end,
}
