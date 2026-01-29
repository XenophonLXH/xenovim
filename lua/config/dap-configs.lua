local dap = require("dap")

-- Set tmux as the external terminal for debuggin
dap.defaults.fallback.external_terminal = {
    command = "tmux",
    args = { "new-window", "-d", "-t", "work:6", "-n", "debug" }
}

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
    tag = "odoo",
    program = '/home/xenophon/Development//odoo/odoo.py',
    pythonPath = "/home/xenophon/Development/.virtualenvs/odoo-9/bin/python",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-9.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    console = "externalTerminal",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 12',
    tag = "odoo",
    program = '/home/xenophon/Development/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/.virtualenvs/odoo-12/bin/python",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-12.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    -- console = "internalConsole",
    console = "externalTerminal",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 13',
    tag = "odoo",
    program = '/home/xenophon/Development/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/.virtualenvs/odoo-13/bin/python3",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-13.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    console = "externalTerminal",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 14',
    tag = "odoo",
    program = '/home/xenophon/Development/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/.virtualenvs/odoo-14/bin/python3",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-14.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    -- console = "internalConsole",
    console = "externalTerminal",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 12 Test',
    tag = "odoo",
    program = '/home/xenophon/Development/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/.virtualenvs/odoo-12/bin/python3",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-12.conf',
            '--test-enable',
            '--log-level=test',
            '--limit-time-real=10000000',
    },
    cwd = '${workspaceFolder}',
    console = "externalTerminal",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 14 Test',
    tag = "odoo",
    program = '/home/xenophon/Development/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/.virtualenvs/odoo-14/bin/python3",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-14.conf',
            '--test-enable',
            '--log-level=test',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    console = "externalTerminal",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Runbot 14',
    tag = "odoo",
    program = '/home/xenophon/Development/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/.virtualenvs/runbot14/bin/python3",
    args = {
            '--config=/home/xenophon/Development/TaskFlow/configs/odoo-server-14-runbot.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
    console = "externalTerminal",
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Odoo 18',
    tag = "odoo",
    program = '/home/xenophon/Development/odoo/odoo-bin',
    pythonPath = "/home/xenophon/Development/.virtualenvs/odoo-18/bin/python3",
    args = {
            '--config=/home/xenophon/Development/Personal/configs/odoo-server-18.conf',
            '--limit-time-real=10000000',
    }, -- Adjust arguments as needed
    cwd = '${workspaceFolder}',
        console = "externalTerminal",
    },
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        tag = "python_file",
        pythonPath = function()
            return "/usr/bin/python3"
        end,
    },
}
