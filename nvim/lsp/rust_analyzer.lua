return {
    cmd = {
        "rust-analyzer",
    },
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                styleLints = {
                    enable = true,
                },
            },
            checkOnSave = true,
            check = {
                command = "clippy",
                features = "all",
                allTargets = true,
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
                features = "all",
            },
            procMacro = {
                enable = true,
            },
            imports = {
                group = {
                    enable = false,
                },
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            completion = {
                postfix = {
                    enable = true,
                },
            },
        },
    },
    root_markers = { "Cargo.toml", "Cargo.lock", "build.rs" },
    filetypes = { "rust", "toml.Cargo" },
}
