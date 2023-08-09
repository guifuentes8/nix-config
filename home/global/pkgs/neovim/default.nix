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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
    
      require("tokyonight").setup({
        style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true,     -- Enable this to disable setting the background color
      })
      require 'base'
      require 'highlights'
      require 'maps'
    '';
    plugins = with pkgs.vimPlugins; [

      # --- THEME ---

      # Tokyo-Night -> theme for neovim
      tokyonight-nvim

      # Lualine -> provides a flexible way to configure statusline 
      {
        plugin = lualine-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/lualine.rc.lua);
      }

      #  --- THEME --- #  

      # --- LSP LANGUAGE SERVER ---

      # LspConfig -> enable language server on Neovim 
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile (./plugins/lspconfig.rc.lua);
      }
      # Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

      # --- LSP LANGUAGE SERVER --- #

      # --- AUTOCOMPLETION ---

      # LspKind -> VSCode-like pictograms
      {
        plugin = lspkind-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/lspkind.rc.lua);
      }
      # Cmp - > A completion engine plugin for neovim
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile (./plugins/cmp.rc.lua);
      }
      luasnip # Snippet engine
      cmp-buffer # buffer words
      cmp-nvim-lsp # dependencies

      # --- AUTOCOMPLETION --- #

      # --- TREESITTER ---
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile (./plugins/treesitter.rc.lua);
      }
      # --- TREESITTER --- #

      # --- AUTOTAG ---
      {
        plugin = nvim-ts-autotag;
        type = "lua";
        config = builtins.readFile (./plugins/autotag.rc.lua);
      }
      # --- AUTOTAG --- #

      # --- AUTOPAIR ---
      {
        plugin = nvim-autopairs;
        type = "lua";
        config = builtins.readFile (./plugins/autopair.rc.lua);
      }
      # --- AUTOPAIR --- #

      # --- TELESCOPE ---
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/telescope.rc.lua);
      }
      plenary-nvim
      # --- TELESCORE --- #

      # --- BUFFERLINE ---
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/bufferline.rc.lua);
      }
      # --- BUFFERLINE --- #

      nvim-web-devicons

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
        plugin = formatter-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/formatter.rc.lua);
      }

    ];

    extraPackages = [
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.vscode-langservers-extracted
      pkgs.lua-language-server
      pkgs.ripgrep
    ];

  };

  home.sessionVariables.EDITOR = "nvim";
  xdg.configFile."nvim/lua/base.lua".source = ./base.lua;
  xdg.configFile."nvim/lua/highlights.lua".source = ./highlights.lua;
  xdg.configFile."nvim/lua/maps.lua".source = ./maps.lua;
  xdg.configFile."nvim/lua/plugins".source = ./plugins;


}


