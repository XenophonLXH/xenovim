require("notify").setup {
    stages = "fade",
    background_color = "FloatShadow",
    timeout = 3000,
}
vim.notify = require("notify")
