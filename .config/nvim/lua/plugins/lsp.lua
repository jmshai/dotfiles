return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Basedpyright for Python
            vim.lsp.config.basedpyright = {
                cmd = { 'basedpyright-langserver', '--stdio' },
                filetypes = { 'python' },
                root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile' },
            }
            
            -- Lua LSP with Neovim-specific config
            vim.lsp.config.lua_ls = {
                cmd = { 'lua-language-server' },
                filetypes = { 'lua' },
                root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml' },
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    }
                }
            }
            
            -- Enable LSP servers
            vim.lsp.enable('basedpyright')
            vim.lsp.enable('lua_ls')
            
            -- Keymaps for LSP
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'Go to definition'})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = 'Hover documentation'})
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {desc = 'Rename'})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = 'Code action'})
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, {desc = 'References'})
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = 'Previous diagnostic'})
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = 'Next diagnostic'})
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {desc = 'Show diagnostic'})
        end
    }
}
