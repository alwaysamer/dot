local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['clangd'].setup { capabilities = capabilities }
require('lspconfig').pylsp.setup { capabilities = capabilities }
require'lspconfig'.rls.setup{}
require('lspconfig').gopls.setup { capabilities = capabilities }
require('lspconfig').csharp_ls.setup { capabilities = capabilities }
