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
            {'odoo'},
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
    else
        error("Runner not available yet: "..runner)
    end
end


function _G.OdooRunner()
    local configs = dap.configurations.python
    local database = vim.fn.input("Database: ", '')
    local update = vim.fn.input("Modules: ", 'all')

    arg_database = "--db-filter="..database
    arg_update = "--update="..update

    vim.ui.select(
        configs,
        {
            prompt = "Select config to run: ",
            format_item = function(config)
                return config.name
            end
        },
        function(config)
            args_list = {table.unpack(config.args), arg_database, arg_update}
            config.args = args_list
            dap.adapters.python.command = config.pythonPath
            print("Using database: "..arg_database)
            print("Using updates: "..arg_update)
            dap.run(config)
        end
    )
end

