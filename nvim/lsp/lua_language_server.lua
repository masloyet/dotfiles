---@type vim.lsp.Config  
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".git", ".luarc.json", ".nvim.lua", "init.lua" },
  settings = {
    Lua = {
      telemetry = { enable = false },
      runtime = { version = 'LuaJIT', },
      diagnostics = { globals = { 'vim' }, },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
}
