return {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx",
        "typescript", "typescriptreact", "typescript.tsx",
    },
    root_markers = { "eslint.config.mjs", "eslint.config.js", ".eslintrc.json", "package.json", ".git" },
    handlers = {
        ["workspace/configuration"] = function(_, params, ctx)
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            local root = client and client.root_dir or vim.fn.getcwd()
            local response = {}
            for _ in ipairs(params.items) do
                table.insert(response, {
                    workspaceFolder = {
                        uri = vim.uri_from_fname(root),
                        name = vim.fs.basename(root),
                    },
                    workingDirectory = { directory = root },
                    packageManager = "pnpm",

                    experimental = { useFlatConfig = false },
                    validate = "on",
                    format = false,
                })
            end
            return response
        end,
    },
}
