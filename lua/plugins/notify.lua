return {
  "rcarriga/nvim-notify",
  opts = {
    fps = 144,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    background_colour = "#000000",
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "static",
    time_formats = {
      notification = "%T",
      notification_history = "%FT%T"
    },
    timeout = 5000,
    top_down = true
  },
  config = function(_, opts)
    vim.notify = require("notify").setup(opts)
    vim.notify = require('notify')
  end,
}
