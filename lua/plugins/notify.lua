return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("notify").setup({
            stages = "fade",
            background_color = "#000000",
            timeout = 0.5,
        })
        vim.notify = require("notify")
    end,
}
