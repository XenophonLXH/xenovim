require("notify").setup({
    stages = "fade",
    background_color = "#000000",
    timeout = 3000,
})
vim.notify = require("notify")
