local lsp = require("lsp-zero")
vim.lsp.set_log_level "off"
lsp.preset("recommended")
lsp.ensure_installed({
  'rust_analyzer',
  'html',
  'luau_lsp',
})

lsp.configure('pylsp', {
    settings = {
        -- configure plugins in pylsp
        pylsp = {
          plugins = {
            pyflakes = {enabled = true},
            mccabe = {enabled = true},
            pylint = {enabled = false},
          },
        },
      },
    root_dir = "/home/xenophon/Development/"
})

lsp.configure('ts_ls', {
    root_dir = "/home/xenophon/Development/"
})
-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
    root_dir = "/home/xenophon/Development/"
})


-- Enable debugging
lsp.configure('rust-analyzer', {
    diagnostics = {
        enabled = true;
    },
    root_dir = "/home/xenophon/Development/"
})

lsp.configure('ruff_lsp', {
    root_dir = "/home/xenophon/Development/"
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function(args) vim.lsp.buf.hover() end, { buffer = args.buf})
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

