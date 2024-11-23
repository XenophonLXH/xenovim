local lspconfig = require('lspconfig')
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.setup()

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Custom LSP
local lsp_configs = require('lspconfig.configs')
if not lsp_configs.odoo_lsp then
    lsp_configs.odoo_lsp = {
        default_config = {
            name = 'odoo-lsp',
            cmd = {'odoo-lsp'},
            filetypes = {'javascript', 'xml', 'python'},
            root_dir = require('lspconfig.util').root_pattern('.odoo_lsp', '.odoo_lsp.json', '.git')
        }
    }
end

lspconfig.odoo_lsp.setup({})

lspconfig.pylsp.setup {
    root_dir = "/home/xenophon/Development/",
}

lspconfig.ts_ls.setup({
    root_dir = "/home/xenophon/Development/"
})

lspconfig.rust_analyzer.setup({
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false;
            }
        },
        root_dir = "/home/xenophon/Development/"
    }
})

local port = '6005'
local cmd = vim.lsp.rpc.connect('127.0.0.1', port)

lspconfig.gdscript.setup({
    force_setup = true, -- Because lsp is global read more on docs for lsp-zero
    single_file_support = false,
    cmd = cmd,
    root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
    filetypes = {'gd', 'gdscript', 'gdscript3' }
})

lspconfig.lua_ls.setup({
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Setup completion mappings
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

-- Set preferences
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

