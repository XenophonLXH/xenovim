local dap = require("dap")
vim.g.dap_open_float = false;
-- local ENV = os.getenv("VIRTUAL_ENV")
-- local function isempty(s)
--     return s == nil or s == ''
-- end

dap.adapters.python = {
  type = 'executable',
  command = '/home/xenophon/Development/.virtualenvs/debugpy/bin/python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 9',
    program = '/home/xenophon/Development/TaskFlow/odoo/odoo.py',
    pythonPath = "/home/xenophon/Development/TaskFlow/venv/odoo-9/bin/python",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-9.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    console = "internalConsole",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 12',
    program = '/home/xenophon/Development/TaskFlow/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/TaskFlow/venv/odoo-12/bin/python",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-12.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    console = "internalConsole",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 13',
    program = '/home/xenophon/Development/TaskFlow/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/TaskFlow/venv/odoo-13/bin/python3",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-13.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    console = "internalConsole",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 14',
    program = '/home/xenophon/Development/TaskFlow/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/TaskFlow/venv/odoo-14/bin/python3",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-14.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    console = "internalConsole",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 12 Test',
    program = '/home/xenophon/Development/TaskFlow/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/TaskFlow/venv/odoo-12/bin/python3",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-12.conf',
            '--test-enable',
            '--log-level=test',
            '--limit-time-real=10000000',
    },
    cwd = '${workspaceFolder}',
    console = "internalConsole",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 14 Test',
    program = '/home/xenophon/Development/TaskFlow/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/TaskFlow/venv/odoo-14/bin/python3",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-14.conf',
            '--test-enable',
            '--log-level=test',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    console = "internalConsole",
  },
}
dap.set_log_level('DEBUG')
