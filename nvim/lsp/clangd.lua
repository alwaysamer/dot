return {
	cmd = { "clangd"},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_markers = { ".clangd", ".clangd-tidy", ".clangd-format", "compile_commands.json", "compile_flags.txt", "configure.ac" },
	single_file_support = true,
}
