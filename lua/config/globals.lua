local dap = require('dap')
local arg_database = ''
local arg_update = ''

-- Runner
function _G.Runner()
    -- Close current sessions
    if dap.session() ~= nil then
        dap.continue()
    else
        local runner = vim.ui.select(
            {'odoo', 'python', 'fastapi'},
            {
                prompt = "What to run?",
                format_item = function(runner)
                    return runner
                end
            },
            function(runner)
                _G.runRunner(runner)
            end
        )
    end
end


function _G.runRunner(runner)
    if runner == 'odoo' then
        _G.OdooRunner()
    elseif runner == 'python' then
        _G.PythonRunner()
    elseif runner == 'fastapi' then
        _G.FastAPIRunner()
    else
        print("Invalid option, doing nothing....")
    end
end


function _G.OdooRunner()
    local configs = dap.configurations.python
    local odoo_configs = {}
    local database = vim.fn.input("Database: ", '')
    local update = vim.fn.input("Modules: ", 'all')

    if database == '' or update == '' then
        print("Invalid database or modules provided. Doing nothing.")
        return
    end

    for i = 1, #configs do
        if configs[i].tag == "odoo" then
            table.insert(odoo_configs,configs[i]);
        end
    end

    arg_database = "--db-filter="..database
    arg_update = "--update="..update

    vim.ui.select(
        odoo_configs,
        {
            prompt = "Select config to run: ",
            format_item = function(config)
                return config.name
            end
        },
        function(config)
            if config == nil then
                print("No config selected. Doing nothing")
                return
            end
            local copy_args = config.args
            table.insert(copy_args, arg_database)
            table.insert(copy_args, arg_update)
            config.args = copy_args
            dap.adapters.python.command = config.pythonPath
            print("Using database: "..arg_database)
            print("Using updates: "..arg_update)
            dap.run(config)
        end
    )
end

function _G.PythonRunner()
    print("Hello I am worlds")
    local configs = dap.configurations.python
    local python_configs = {}
    for i = 1, #configs do
        if configs[i].tag == "python_file" then
            table.insert(python_configs, configs[i])
        end
    end

    vim.ui.select(
        python_configs,
        {
            prompt = "Select config to run: ",
            format_item = function(config)
                return config.name
            end
        },
        function(config)
            local copy_args = config.args
            config.args = copy_args
            dap.run(config)
        end
    )
end

function _G.FastAPIRunner()
    local configs = dap.configurations.python
    local fastapi_configs = {}
    for i = 1, #configs do
        if configs[i].tag == "fastapi" then
            table.insert(fastapi_configs, configs[i])
        end
    end

    vim.ui.select(
        fastapi_configs,
        {
            prompt = "Select config to run: ",
            format_item = function(config)
                return config.name
            end
        },
        function(config)
            if config == nil then
                print("No config selected. Doing nothing")
                return
            end
            dap.run(config)
            require("dapui").open()
        end
    )
end

function _G.Conditional()
    local condition = vim.fn.input("Condition: ", "")
    dap.toggle_breakpoint(condition)
end
