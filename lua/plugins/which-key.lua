return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay = 500,
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add({
            { "<leader>c",  group = "Code / Copilot" },
            { "<leader>g",  group = "Go to" },
            { "<leader>f",  group = "Find" },
            { "<leader>b",  group = "Buffer" },
            { "<leader>x",  group = "Lists" },
            { "<leader>q",  group = "Quit" },
            { "<leader>p",  group = "Project" },
            { "<leader>s",  group = "Search" },
            { "]",          group = "Next" },
            { "[",          group = "Prev" },
            { "z",          group = "Fold / Spell" },
            { "g",          group = "Go / Comments" },
        })
    end,
}
