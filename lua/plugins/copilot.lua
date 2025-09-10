return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_workspace_folders = {"~/Development/"}
        -- Disable copilot by default
        vim.cmd("Copilot disable")
    end
}
