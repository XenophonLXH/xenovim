return {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        { "nvim-neotest/nvim-nio" },
        { "mfussenegger/nvim-dap" },
        { "rcarriga/nvim-dap-ui" },
    },
    config = function()
        require('dap-python').setup('/home/xenophon/Development/.virtualenvs/debugpy/bin/python')

        vim.fn.sign_define('DapBreakpoint',          { text = '●', texthl = 'DiagnosticError', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = 'DiagnosticWarn',  linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpointRejected',  { text = '◯', texthl = 'DiagnosticHint',  linehl = '', numhl = '' })
        vim.fn.sign_define('DapLogPoint',            { text = '◆', texthl = 'DiagnosticInfo',  linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped',             { text = '▶', texthl = 'DiagnosticOk',    linehl = 'debugPC', numhl = '' })
    end,
}
