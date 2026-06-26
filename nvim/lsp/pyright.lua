---@type vim.lsp.Config  
return {
  cmd = { 'uvx', '--from', 'pyright', 'pyright-langserver', '--stdio' },
  root_markers = { 'pyproject.toml', 'requirements.txt', '.venv' },
  filetypes = { 'python' },
}
