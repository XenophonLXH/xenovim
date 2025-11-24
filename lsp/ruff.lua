return {
    cmd = { "ruff", "server" }, -- Command to start the Ruff server
    filetypes = { "python" },
    settings = {
        format = { enable = true },
        lineLength = 100,
        lint = {
            enabled = true,
            preview = true,
            select = {
                "UP",
                "E501",
                "ERA",
                "EXE",
                "ISC002",
                "ISC003",
                "LOG",
                "T20",
                "Q",
                "RET",
                "SIM",
                "E",
                "W",
                "N",
                "PERF",
                "F",
            },
            ignore = {
                "W503",
                "W504",
            }
        },
    },
}
