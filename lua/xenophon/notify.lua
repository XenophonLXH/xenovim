require("notify").setup({
    stages = "fade",
    background_color = "#000000",
    timeout = 0.5,
})
vim.notify = require("notify")
