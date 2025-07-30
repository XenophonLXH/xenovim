return {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        { "nvim-neotest/nvim-nio" },
        { "mfussenegger/nvim-dap" },
        { "rcarriga/nvim-dap-ui" },
    },
    config = function()
        require('dap-python').setup('/home/xenophon/Development/.virtualenvs/debugpy/bin/python')
    end,
}
