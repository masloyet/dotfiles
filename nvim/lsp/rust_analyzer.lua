return {
    cmd = { "rust-analyzer" },
    root_markers = { "Cargo.toml", "Cargo.lock" },
    filetypes = { "rust" },
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
            inlayHints = {
                bindingModeHints = { enabled = true },
                closureCaptureHints = { enabled = true },
                closureReturnTypeHints = { enable = "always" },
                maxLength = 100,
            },
        },
    },
}
