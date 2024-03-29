vim.opt_local.softtabstop=2
vim.opt_local.shiftwidth=2
vim.opt_local.tabstop=2

-- For c use clangd as a language server if a compile_commands.json can be found.

local compile_commands_path = vim.fs.find('compile_commands.json', {
    upward = true,
    stop = vim.loop.os_homedir(),
    limit = 1
})[1]

if compile_commands_path == nil then
    print("Could not find compile_commands.json in parent directories, not starting LSP.")
    return
end

local compile_commands_dir = vim.fs.dirname(compile_commands_path)

-- if working on serenity, use the clangd from its toolchain.
if compile_commands_dir == "/Users/masonloyet/dev/serenity" then
    clangd_executable = "/Users/masonloyet/dev/serenity/Toolchain/Build/clang/llvm/bin/clangd"
else
    clangd_executable = "clangd"
end

vim.lsp.start({
    name = 'clangd-server',
    cmd = {clangd_executable, '--compile-commands-dir=' .. compile_commands_dir},
    root_dir = compile_commands_dir,
})
