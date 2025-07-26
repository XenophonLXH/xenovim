return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    settings = {
        pylsp = {
            configurationSources = { 'flake8' },
            plugins = {
                flake8 = {
                    enabled = false,
                    ignore = { 'E501', 'E231' },
                    maxLineLength = 88,
                },
                black = {enabled = true},
                autopep8 = { enabled = false },
                mccabe = {enabled = true},
                pycodestyle = {
                    enabled = true,
                    ignore = { 'E501', 'E231' },
                    maxLineLength = 88,
                },
                pyflakes = {enabled = true},
                jedi_completion = {
                    include_params = true,
                },
                jedi_signature_help = {enabled = true},
                jedi = {
                    extra_paths = {
                        '/home/xenophon/Development/TaskFlow/',
                        '/home/xenophon/Development/TaskFlow/odoo/',
                        '/home/xenophon/Development/TaskFlow/taskflow/',
                        '/home/xenophon/Development/TaskFlow/taskflow-config/'
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
