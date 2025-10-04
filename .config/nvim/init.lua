-- Vim Options

vim.o.rnu = true
vim.o.nu = true
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.breakindent = true
vim.o["tabstop"] = 4
vim.o["shiftwidth"] = 4
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"

vim.g.mapleader = " "


-- Keymaps
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>f', ':Files<CR>')

vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', {desc = 'Move line up'})
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', {desc = 'Move line down'})
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", {desc = 'Move selection up'})
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", {desc = 'Move selection down'})

require("config.lazy")

