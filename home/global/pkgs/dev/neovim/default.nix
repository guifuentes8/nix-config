{ pkgs, lib, config, unstable, ... }:
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

  programs.vim = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    package = unstable.neovim-unwrapped;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
      require 'base'
      require 'highlights'
      require 'maps'
    '';
    plugins = with unstable.vimPlugins; [

      {
        plugin = lualine-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/lualine.rc.lua);
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile (./plugins/lspconfig.rc.lua);
      }
      {
        plugin = lspkind-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/lspkind.rc.lua);
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile (./plugins/cmp.rc.lua);
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile (./plugins/treesitter.rc.lua);
      }
      {
        plugin = nvim-ts-autotag;
        type = "lua";
        config = builtins.readFile (./plugins/autotag.rc.lua);
      }
      {
        plugin = nvim-autopairs;
        type = "lua";
        config = builtins.readFile (./plugins/autopair.rc.lua);
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/telescope.rc.lua);
      }
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/bufferline.rc.lua);
      }
      {
        plugin = nvim-colorizer-lua;
        type = "lua";
        config = builtins.readFile (./plugins/colorizer.rc.lua);
      }
      {
        plugin = lspsaga-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/lspsaga.rc.lua);
      }
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/gitsign.rc.lua);
      }
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile (./plugins/tree.rc.lua);
      }
      {
        plugin = dashboard-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/dashboard.rc.lua);
      }
      {
        plugin = (fromGitHub "55639cd95a9d382c98f99e7cc30b61cc00c4ae6d" "HEAD" "shrikecode/kyotonight.vim");
        type = "lua";
        config = builtins.readFile (./plugins/theme.rc.lua);
      }
      {
        plugin = nvterm;
        type = "lua";
        config = builtins.readFile (./plugins/terminal.rc.lua);
      }

      luasnip # Snippet engine
      cmp-buffer # buffer words
      cmp-nvim-lsp # dependencies
      plenary-nvim
      nvim-web-devicons
      markdown-preview-nvim
      zen-mode-nvim

      (fromGitHub "fd35a46f4b7c1b244249266bdcb2da3814f01724" "HEAD" "xiyaowong/transparent.nvim")

    ];

    extraPackages = with pkgs; [
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.live-server
      nodePackages.graphql-language-service-cli
      marksman
      tailwindcss-language-server
      lua-language-server
      nixfmt
      nixd
    ];

  };


  home.sessionVariables.EDITOR = "nvim";
  xdg.configFile."nvim/lua/base.lua".source = ./base.lua;
  xdg.configFile."nvim/lua/highlights.lua".source = ./highlights.lua;
  xdg.configFile."nvim/lua/maps.lua".source = ./maps.lua;
  xdg.configFile."nvim/lua/plugins".source = ./plugins;

}

