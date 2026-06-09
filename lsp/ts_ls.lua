return {
    cmd = {
        "typescript-language-server",
        "--stdio",
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_dir = function(bufnr, on_dir)
        local name = vim.api.nvim_buf_get_name(bufnr)
        if name == "" then return end
        local marker = vim.fs.find(
            { "tsconfig.json", "package.json", ".git" },
            { upward = true, path = vim.fs.dirname(vim.fs.normalize(name)) }
        )[1]
        on_dir(marker and vim.fs.dirname(marker) or vim.fs.dirname(vim.fs.normalize(name)))
    end,
}
