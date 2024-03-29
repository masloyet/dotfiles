-- For python use pyright as a language server if a setup.py or requirements.txt can be found

local setup_path = vim.fs.find('setup.py', {
    upward = true,
    stop = vim.loop.os_homedir(),
    limit = 1
})[1]

local requirements_path = vim.fs.find('requirements.txt', {
    upward = true,
    stop = vim.loop.os_homedir(),
    limit = 1
})[1]

local root_dir = vim.fs.dirname(setup_path or requirements_path)

if root_dir == nil then
    print("Could not find setup.py or requirements.txt in parent directories, not starting LSP.")
    return
else
    print("Using " .. root_dir .. " for lsp.")
end

vim.lsp.start({
    name = 'pylsp-server',
    cmd = { 'pylsp' },
    root_dir = root_dir,
})
