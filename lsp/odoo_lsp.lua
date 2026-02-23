return {
  cmd = { "odoo-lsp" },
  filetypes = { "python", "xml", "javascript" },

  -- Neovim built-in LSP root resolver signature
  root_dir = function(bufnr, on_dir)
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name == "" then return end
    if name:match("^%w+://") then return end -- Oil and other URI-like buffers

    local full = vim.fs.normalize(name)

    local allowed = {
      vim.fs.normalize(vim.fn.expand("~/Development/odoo")),
      vim.fs.normalize(vim.fn.expand("~/Development/TaskFlow/taskflow")),
      vim.fs.normalize(vim.fn.expand("~/Development/TaskFlow/taskflow-config")),
    }

    local inside = false
    for _, base in ipairs(allowed) do
      if full:sub(1, #base) == base then
        inside = true
        break
      end
    end
    if not inside then return end

    local start = vim.fs.dirname(full)
    local marker = vim.fs.find({ ".git", "pyproject.toml", "setup.py", "odoo.conf" }, {
      upward = true,
      path = start,
    })[1]

    local root = marker and vim.fs.dirname(marker) or start
    on_dir(root)
  end,
}
