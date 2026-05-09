vim.keymap.set('i', 'jk', '<Esc>')

vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.encoding = 'utf-8'
vim.opt.ruler = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard:append('unnamedplus')
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.completeopt:remove('preview')
vim.opt.jumpoptions = 'stack'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.exrc = true

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.keymap.set('n', '<leader>f', ':FZF<CR>', { silent = true })
vim.keymap.set('n', '<leader>up', ':checkt<CR>', { silent = true })
vim.keymap.set('n', '<leader>n', ':noh<CR>', { silent = true })
vim.keymap.set('n', '<leader>v', ':vs<CR>')
vim.keymap.set('n', '<leader>=', '<C-w>=')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.api.nvim_create_user_command('Ggr', function(opts)
    vim.cmd('silent Ggrep! ' .. opts.args .. ' | bo cw | redraw!')
end, { nargs = '+' })

vim.opt.rtp:append(vim.fn.expand('~/.fzf'))

local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({
    gh('junegunn/fzf.vim'),
    gh('christoomey/vim-tmux-navigator'),
    gh('tpope/vim-fugitive'),
    gh('tpope/vim-commentary'),
    gh('neovim/nvim-lspconfig'),
    gh('nvim-treesitter/nvim-treesitter'),
    gh('sainnhe/gruvbox-material'),
})

vim.cmd('colorscheme gruvbox-material')

require('nvim-treesitter.install').install({ 'lua', 'c', 'cpp', 'python', 'rust' })

require('lsp')
