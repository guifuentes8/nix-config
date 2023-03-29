{ pkgs, lib, config, ... }:
let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
in
{

  home.sessionVariables.EDITOR = "nvim";


  home.packages = with pkgs; [

  ];

  xdg.configFile."nvim/lua/settings.lua".source = ./settings.lua;
  xdg.configFile."nvim/lua/keybinds.lua".source = ./keybinds.lua;


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
      require 'settings'
      require 'keybinds'
    '';
    plugins = with pkgs.vimPlugins; [
      ale
      catppuccin-nvim
      nerdtree
      nerdtree-git-plugin
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      telescope-nvim
      vim-airline
      vim-airline-themes
      vim-css-color
      vim-devicons
      vim-floaterm
      vim-nerdtree-syntax-highlight
      vim-plug
      vim-polyglot
    ];

    #coc = {
    #       enable = true;
    #       settings = {
    #         "suggest.noselect" = true;
    #         "suggest.enablePreview" = true;
    #         "suggest.enablePreselect" = false;
    #         "suggest.disableKind" = true;
    #       };
    #     };
    #   };

  };


}

