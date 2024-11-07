local gdproject = io.open(vim.fs.dirname(vim.fs.find({ 'project.godot' }, { upward = true, path = vim.api.nvim_buf_get_name(0) })[1]) or '')
if gdproject then
    io.close(gdproject)
    vim.fn.serverstart '/tmp/godot.pipe'
end
