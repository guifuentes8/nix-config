{ ... }: {
  programs.nixvim.plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        markdown = [ "vale" ];
        nix = [ "nix" ];
        javascript = [ "eslint" ];
        typescript = [ "eslint" ];
        javascriptreact = [ "eslint" ];
        typescriptreact = [ "eslint" ];
        svelte = [ "eslint_d" ];
        python = [ "pylint" ];
      };
      autoCmd = {
        callback = {
          __raw = ''
            function()
              require('lint').try_lint()
            end
          '';
        };
        event = "BufWritePost";
      };
      linters = {
        eslint = {
          args = [
            "--no-warn-ignored"
            "--format"
            "json"
            "--stdin"
            "--stdin-filename"
          ];
        };
      };

    };
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          css = [ "prettierd" ];
          graphql = [ "prettierd" ];
          html = [ "prettierd" ];
          javascript = [ "prettierd" ];
          javascriptreact = [ "prettierd" ];
          json = [ "prettierd" ];
          lua = [ "stylua" ];
          markdown = [ "prettierd" ];
          nix = [ "nixfmt" ];
          python = [ "ruff_fix" "ruff_format" ];
          svelte = [ "prettierd" ];
          typescript = [ "prettierd" ];
          typescriptreact = [ "prettierd" ];
          yaml = [ "prettierd" ];

        };
        format_on_save = {
          timeout_ms = 500;
          lsp_fallback = true;
          async = false;
        };
      };

    };
  };
}
