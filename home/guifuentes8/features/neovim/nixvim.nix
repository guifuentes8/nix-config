{ pkgs, inputs, lib, ... }:
let
  fromGitHub = rev: ref: repo:
    pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
        rev = rev;
      };
    };
in
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    extraConfigLua = ''
      require 'settings'
      require 'highlights'
      require 'maps'
    '';
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
      bufferline.enable = true;
      conform-nvim.enable = true;
      cmp.enable = true;
      dashboard.enable = true;
      gitsigns.enable = true;
      indent-blankline.enable = true;
      luasnip.enable = true;
      lualine.enable = true;
      lsp.enable = true;
      lspkind.enable = true;
      lspsaga.enable = true;
      lint.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer.enable = true;
      noice.enable = true;
      neorg.enable = true;
      rainbow-delimiters.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      cmp-buffer # buffer words
      cmp-nvim-lsp # dependencies
      cmp_luasnip

      plenary-nvim
      nvim-web-devicons
      zen-mode-nvim
      nvim-spectre
      friendly-snippets
      inc-rename-nvim

      # Neorg dependencies

      # Noice dependencies
      nui-nvim
      nvim-notify
      nvim-lsp-notify

      # Telescope extensions 
      telescope-project-nvim
      telescope-github-nvim
      telescope-media-files-nvim
      telescope-file-browser-nvim

    ];
    colorschemes.tokyonight.enable = true;
  };



  xdg.configFile."nvim/lua/settings.lua".source = ./settings.lua;
  xdg.configFile."nvim/lua/highlights.lua".source = ./highlights.lua;
  xdg.configFile."nvim/lua/maps.lua".source = ./maps.lua;
  xdg.configFile."nvim/lua/plugins".source = ./plugins;

  home.sessionVariables.EDITOR = "nvim";

}
