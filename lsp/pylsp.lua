return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    settings = {
        pylsp = {
            configurationSources = { 'flake8' },
            plugins = {
                flake8 = {
                    enabled = true,
                    ignore = {
                        '*',
                    },
                    maxLineLength = 120,
                },
                black = {
                    enabled = true,
                },
                autopep8 = {
                    enabled = true,
                    ignore = {
                        "W503",
                    },
                },
                mccabe = {
                    enabled = true,
                    ignore = {
                        "W503",
                    },
                },
                pycodestyle = {
                    enabled = true,
                    ignore = { 'E501', 'E231', 'W503' },
                    maxLineLength = 120,
                },
                pyflakes = {
                    enabled = true,
                    ignore = {
                        '*',
                        'W503'
                    },
                },
                jedi_completion = {
                    include_params = true,
                },
                jedi_signature_help = {enabled = true},
                jedi = {
                    extra_paths = {
                        '/home/xenophon/Development/',
                        '/home/xenophon/Development/odoo',
                        '/home/xenophon/Development/.virtualenvs',
                        '/home/xenophon/Development/TaskFlow',
                        '/home/xenophon/Development/TaskFlow/taskflow',
                        '/home/xenophon/Development/TaskFlow/taskflow-config',
                    },
                },
            },
        },
    },
    root_markers = {
        '.git',
        'setup.py',
        'pyproject.toml',
        'requirements.txt',
    },
    -- root_dir = "/home/xenophon/Development/",
}
