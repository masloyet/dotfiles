vim.api.nvim_set_keymap('n', '<leader>b', ':!cargo build<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t', ':!cargo test<CR>', { noremap = true, silent = true})

vim.lsp.enable('rust_analyzer')
