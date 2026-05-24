-- ============================================================
-- PLUGINS
-- ============================================================
vim.pack.add({
  -- Theme
  { src = "https://github.com/neanias/everforest-nvim" },

  -- File explorer
  { src = "https://github.com/stevearc/oil.nvim" },

  -- Icons
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- LaTeX
  { src = "https://github.com/lervag/vimtex" },

  -- Fuzzy finder
  { src = "https://github.com/junegunn/fzf" },
  { src = "https://github.com/junegunn/fzf.vim" },

  -- LSP
  { src = "https://github.com/neovim/nvim-lspconfig" },

  -- Completion
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },
})

-- ============================================================
-- THEME
-- ============================================================
vim.o.background = "dark"
require("everforest").setup({
  background = "soft",
})
vim.cmd("colorscheme everforest")

local theme = vim.fn.system("cat ~/.config/kitty/current-theme.conf")
if theme:lower():find("dark") then
  vim.o.background = "dark"
else
  vim.o.background = "light"
end
-- ============================================================
-- VIM OPTIONS
-- ============================================================
vim.o.rnu = true
vim.o.nu = true
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.breakindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.g.mapleader = " "

-- ============================================================
-- KEYMAPS
-- ============================================================
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>f', ':Files<CR>')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('n', '<leader>g', function()
  vim.cmd('tabnew | terminal lazygit')
  vim.cmd('startinsert')
end, { desc = 'Lazygit' })

-- ============================================================
-- OIL
-- ============================================================
require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})

-- ============================================================
-- VIMTEX
-- ============================================================
vim.g.vimtex_view_method = 'sioyek'
vim.g.vimtex_view_sioyek_exe = '/Applications/sioyek.app/Contents/MacOS/sioyek'
vim.g.vimtex_callback_progpath = '/opt/homebrew/bin/nvim'
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
  build_dir = '',
  callback = 1,
  continuous = 1,
  executable = 'latexmk',
  hooks = {},
  options = {
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
vim.g.vimtex_toc_config = {
  name = 'TOC',
  layers = { 'content', 'todo', 'include' },
  split_width = 25,
  todo_sorted = 0,
  show_help = 1,
  show_numbers = 1,
}
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_syntax_conceal = {
  accents = 1,
  ligatures = 1,
  cites = 1,
  fancy = 1,
  spacing = 0,
  greek = 1,
  math_bounds = 0,
  math_delimiters = 1,
  math_fracs = 1,
  math_super_sub = 1,
  math_symbols = 1,
  sections = 0,
  styles = 1,
}

-- ============================================================
-- LSP
-- ============================================================
vim.lsp.config.basedpyright = {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile' },
}
vim.lsp.config.lua_ls = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    }
  }
}
vim.lsp.enable('basedpyright')
vim.lsp.enable('lua_ls')

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'References' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- ============================================================
-- COMPLETION
-- ============================================================
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  }),
})

-- ============================================================
-- SPELLCHECK
-- ============================================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "markdown" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_gb"
  end,
})


-- ============================================================
-- GIT STATUSLINE
-- ============================================================
local function git_branch()
  return vim.fn.system("git -C " .. vim.fn.expand("%:h") .. " branch --show-current 2>/dev/null | tr -d '\n'")
end

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.b.git_branch = git_branch()
  end,
})

vim.o.statusline = " %f %m %= %{b:git_branch} "
