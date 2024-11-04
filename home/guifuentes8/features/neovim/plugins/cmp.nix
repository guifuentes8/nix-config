{ ... }: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      settings = {
        snippet = {
          expand =
            "function(args) require('luasnip').lsp_expand(args.body) end";
        };
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            })
          '';
        };
        sources = {
          __raw = ''
            cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            }, {
              { name = 'buffer' },
            })
          '';
        };
        formatting = {
          expandable_indicator = true;
          # format = "\n";
        };
      };
    };

  };
}