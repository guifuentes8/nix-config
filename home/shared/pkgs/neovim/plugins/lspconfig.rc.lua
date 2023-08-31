local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end
local util = require 'lspconfig.util'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function() vim.lsp.buf.format() end
      })
    end
end


-- LUA

nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get language server to recognize the vim global
                globals = { 'vim' }
            },

            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false

            }
        }
    }
}


-- HTML 

nvim_lsp.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    
}

-- CSS

nvim_lsp.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
 
}

-- JAVASCRIPT

nvim_lsp.eslint.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = util.root_pattern('.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json', '.eslintrc'),
  }

-- TYPESCRIPT

  nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  
}


-- JSON

nvim_lsp.jsonls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  
}

-- NIX

nvim_lsp.nixd.setup {    
    on_attach = on_attach,
   
}