{ pkgs, inputs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    extraLuaPackages = luaPkgs:
      with luaPkgs; [
        lua-utils-nvim
        nvim-nio
        pathlib-nvim
      ];
    extraPackages = with pkgs; [

      # Language servers
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.pyright
      marksman
      tailwindcss-language-server
      lua-language-server
      nixd
      # Conform
      ruff # Python
      # Linters
      eslint_d
      nixfmt-classic
      prettierd
      pylint
      # Others
      nodePackages.live-server
    ];
    options = {
      ai = true;
      backup = false;
      backupskip = "/tmp";
      backspace = "start,eol,indent";
      breakindent = true;
      clipboard = "unnamedplus";
      cmdheight = 1;
      encoding = "utf-8";
      expandtab = true;
      foldmethod = "indent";
      # formatoptions.append = [ "r" ];
      fileencoding = "utf-8";
      hlsearch = true;
      inccommand = "split";
      ignorecase = true;
      laststatus = 2;
      # path.append = [ "**" ];
      scrolloff = 999;
      shell = "zsh";
      shiftwidth = 2;
      showcmd = true;
      si = true;
      smarttab = true;
      splitbelow = true;
      splitright = true;
      tabstop = 4;
      title = true;
      #wildignore.append = [
      #   " */node_modules"
      # ];
      wrap = true;
    };


    plugins = {
      alpha.enable = true;
      alpha.theme = "dashboard";
      luasnip.enable = true;
      lualine.enable = true;
      lsp.enable = true;
      lspkind.enable = true;
      lspsaga.enable = true;
      lint.enable = true;
      conform-nvim.enable = true;
      bufferline.enable = true;
      noice.enable = true;
      neorg.enable = true;
      rainbow-delimiters.enable = true;
      cmp.enable = true;
      indent-blankline.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
    };

    extraPlugins = [ pkgs.vimPlugins.everforest ];
    colorscheme = "everforest";
  };

}
