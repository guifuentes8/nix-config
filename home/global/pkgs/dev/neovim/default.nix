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
      require 'settings'
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
        plugin = alpha-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/alpha.rc.lua);
      }
      {
        plugin = nvterm;
        type = "lua";
        config = builtins.readFile (./plugins/terminal.rc.lua);
      }
      {
        plugin = multicursors-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/multicursors.rc.lua);
      }
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/indent.rc.lua);
      }
      {
        plugin = nvim-scrollbar;
        type = "lua";
        config = builtins.readFile (./plugins/scrollbar.rc.lua);
      }
      {
        plugin = neo-tree-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/neotree.rc.lua);
      }


      {
        #plugin = (fromGitHub "06a600c4fa49e7a4c44848d14c353ecbaab8eb9f" "HEAD" "neanias/everforest-nvim");
        plugin = (fromGitHub "040aa565ef75bc1e2b566e3fc5d953ccaecd1447" "HEAD" "shrikecode/kyotonight.vim");
        type = "lua";
        config = builtins.readFile (./plugins/theme.rc.lua);
      }



      cmp-buffer # buffer words
      cmp-nvim-lsp # dependencies
      plenary-nvim
      nvim-web-devicons
      markdown-preview-nvim
      zen-mode-nvim
      nvim-spectre
      luasnip
      popup-nvim
      image-nvim

      # Themes

      # Telescope 
      telescope-project-nvim
      telescope-github-nvim
      telescope-media-files-nvim
      telescope-undo-nvim


      #(fromGitHub "fd35a46f4b7c1b244249266bdcb2da3814f01724" "HEAD" "xiyaowong/transparent.nvim")
      #      {
      #        plugin = nvim-tree-lua;
      #        type = "lua";
      #        config = builtins.readFile (./plugins/tree.rc.lua);
      #      }
      #
      #  {
      #    plugin = barbar-nvim;
      #    type = "lua";
      #    config = builtins.readFile (./plugins/barbar.rc.lua);
      #  }


      {
        plugin = bufferline-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/bufferline.rc.lua);
      }
      #

    ];

    extraPackages = with pkgs; [

      # Language servers
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.graphql-language-service-cli
      nodePackages.pyright
      marksman
      tailwindcss-language-server
      lua-language-server
      nixd

      # Others
      nodePackages.live-server
    ];

  };


  home.sessionVariables.EDITOR = "nvim";
  xdg.configFile."nvim/lua/settings.lua".source = ./settings.lua;
  xdg.configFile."nvim/lua/highlights.lua".source = ./highlights.lua;
  xdg.configFile."nvim/lua/maps.lua".source = ./maps.lua;
  xdg.configFile."nvim/lua/plugins".source = ./plugins;

}

