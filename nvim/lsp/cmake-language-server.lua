return {
	cmd = { "cmake-language-server" },
	filetypes = { "cmake" },
	root_markers = { 'CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake', 'CMakeLists.txt' },
	single_file_support = true,
}
