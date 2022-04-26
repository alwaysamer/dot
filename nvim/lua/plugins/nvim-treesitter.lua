require 'nvim-treesitter.install'.compilers = {"clang"}
require'nvim-treesitter.configs'.setup {
ensure_installed = { "c", "cpp", "c_sharp", "python", "http", "json", "rust", "go", "gomod" },
sync_install = false,
highlight = {
  enable = true,
  additional_vim_regex_highlighting = false
  }
}
