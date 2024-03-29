-- Diagnostics Mappings.

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)


-- LSP Mappings.

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufopts = { noremap = true, silent = true, buffer = args.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action { apply = true } end, bufopts)
        vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)
    end,
})
