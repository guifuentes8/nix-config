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
  xdg.configFile."nvim/lua/plugins.lua".source = ./plugins.lua;


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
        require 'settings'
        require 'keybinds'
        require 'plugins'


        -- disable netrw at the very start of your init.lua (strongly advised)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true


    '';
    plugins = with pkgs.vimPlugins; [
      dashboard-nvim
      lualine-nvim
      nightfox-nvim
      nvim-lspconfig
      nvim-tree-lua
      nvim-scrollbar
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      plenary-nvim
      telescope-nvim
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

