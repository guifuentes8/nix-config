{ ... }:
let
  onAttachFunction = ''
    local on_attach = function(client, bufnr)
      -- format on save
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function() vim.lsp.buf.format() end
        })
      end
    end  '';
in {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      onAttach = onAttachFunction;
      servers = {
        eslint = {
          enable = true;
          filetypes =
            [ ".eslintrc.js" ".eslintrc.cjs" ".eslintrc.json" ".eslintrc" ];
          onAttach.function = onAttachFunction;
        };
        nixd = {
          enable = true;
          onAttach.function = onAttachFunction;
        };
        tsserver = {
          enable = true;
          onAttach.function = onAttachFunction;
        };
        html = {
          enable = true;
          onAttach.function = onAttachFunction;
        };
        cssls = {
          enable = true;
          onAttach.function = onAttachFunction;
        };
        tailwindcss = {
          enable = true;
          onAttach.function = onAttachFunction;
        };
        graphql = {
          enable = true;
          onAttach.function = onAttachFunction;
        };

        jsonls = {
          enable = true;
          onAttach.function = onAttachFunction;
        };
        pyright = {
          enable = true;
          onAttach.function = onAttachFunction;
        };
        marksman = {
          enable = true;
          onAttach.function = onAttachFunction;
        };
        lua_ls = {
          enable = true;
          onAttach.function = onAttachFunction;
        };

      };
    };
  };
}
