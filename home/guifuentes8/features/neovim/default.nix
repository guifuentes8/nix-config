{ lib, pkgs, inputs, ... }:
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

in {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs = {
    
    ripgrep.enable = true;
    tmux.enable = true;
    vim.enable = true;
    nixvim = {
       enable = true; 
       extraConfigLuaPre = ''
       
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
      
       colorschemes.tokyonight = {
      enable = true;
      settings = {
  day_brightness = 0.3;
  dim_inactive = false;
  hide_inactive_statusline = false;
  light_style = "day";
  lualine_bold = false;
  on_colors = "function(colors) end";
  on_highlights = "function(highlights, colors) end";
  sidebars = [
    "qf"
    "vista_kind"
    "terminal"
    "packer"
  ];
  style = "night";
  styles = {
    comments = {
      italic = true;
    };
    floats = "dark";
    functions = { };
    keywords = {
      italic = true;
    };
    sidebars = "dark";
    variables = { };
  };
  terminal_colors = true;
  transparent = false;
};

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
    };

    # neovim = {
    #   enable = true;
    #   package = pkgs.neovim-unwrapped;
    #   defaultEditor = true;
    #   viAlias = true;
    #   vimAlias = true;
    #   vimdiffAlias = true;
    #   extraLuaPackages = luaPkgs:
    #     with luaPkgs; [
    #       lua-utils-nvim
    #       nvim-nio
    #       pathlib-nvim
    #     ];

    #   extraLuaConfig = ''
    #     require 'settings'
    #     require 'highlights'
    #     require 'maps'
    #   '';
    #   extraConfig = "\n";
    #   plugins = with pkgs.vimPlugins; [
    #     #{
    #     #  plugin = (fromGitHub "114cca2f31dc9d0ad37f5a34d5cda0e2acba265a" "HEAD"
    #     #    "max397574/neorg-kanban");
    #     #  type = "lua";
    #     #config = builtins.readFile (./plugins/theme.rc.lua);
    #     #}
    #     #        {
    #     #          plugin = catppuccin-nvim;
    #     #          type = "lua";
    #     #          config = builtins.readFile (./plugins/theme.rc.lua);
    #     #        }
    #     {
    #       plugin = lualine-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/lualine.rc.lua);
    #     }
    #     {
    #       plugin = nvim-lspconfig;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/lspconfig.rc.lua);
    #     }
    #     {
    #       plugin = lspkind-nvim;
    #       type = "lua";
    #       # config = builtins.readFile (./plugins/lspkind.rc.lua);
    #     }
    #     {
    #       plugin = luasnip;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/luasnip.rc.lua);
    #     }
    #     {
    #       plugin = nvim-cmp;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/cmp.rc.lua);
    #     }
    #     {
    #       plugin = (nvim-treesitter.withPlugins (_:
    #         nvim-treesitter.allGrammars
    #         ++ [ (pkgs.tree-sitter-grammars.tree-sitter-norg-meta) ]));
    #       type = "lua";
    #       config = builtins.readFile (./plugins/treesitter.rc.lua);
    #     }
    #     {
    #       plugin = nvim-ts-autotag;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/autotag.rc.lua);
    #     }
    #     {
    #       plugin = nvim-autopairs;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/autopair.rc.lua);
    #     }
    #     {
    #       plugin = telescope-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/telescope.rc.lua);
    #     }
    #     {
    #       plugin = nvim-colorizer-lua;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/colorizer.rc.lua);
    #     }
    #     {
    #       plugin = lspsaga-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/lspsaga.rc.lua);
    #     }
    #     {
    #       plugin = gitsigns-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/gitsign.rc.lua);
    #     }
    #     {
    #       plugin = alpha-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/alpha.rc.lua);
    #     }
    #     {
    #       plugin = indent-blankline-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/indent.rc.lua);
    #     }
    #     {
    #       plugin = nvim-scrollbar;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/scrollbar.rc.lua);
    #     }
    #     {
    #       plugin = nvim-lint;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/lint.rc.lua);
    #     }
    #     {
    #       plugin = conform-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/conform.rc.lua);
    #     }
    #     {
    #       plugin = bufferline-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/bufferline.rc.lua);
    #     }
    #     {
    #       plugin = rainbow-delimiters-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/rainbow.rc.lua);
    #     }
    #     {
    #       plugin = neorg;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/neorg.rc.lua);
    #     }
    #     {
    #       plugin = noice-nvim;
    #       type = "lua";
    #       config = builtins.readFile (./plugins/noice.rc.lua);
    #     }

    #     cmp-buffer # buffer words
    #     cmp-nvim-lsp # dependencies
    #     cmp_luasnip

    #     plenary-nvim
    #     nvim-web-devicons
    #     zen-mode-nvim
    #     nvim-spectre
    #     friendly-snippets
    #     inc-rename-nvim

    #     # Neorg dependencies

    #     # Noice dependencies
    #     nui-nvim
    #     nvim-notify
    #     nvim-lsp-notify

    #     # Telescope extensions 
    #     telescope-project-nvim
    #     telescope-github-nvim
    #     telescope-media-files-nvim
    #     telescope-file-browser-nvim
    #   ];

    #   extraPackages = with pkgs; [

    #     # Language servers
    #     nodePackages.typescript-language-server
    #     nodePackages.vscode-langservers-extracted
    #     nodePackages.pyright
    #     marksman
    #     tailwindcss-language-server
    #     lua-language-server
    #     nixd

    #     # Conform
    #     ruff # Python

    #     # Linters
    #     eslint_d
    #     nixfmt-classic
    #     prettierd
    #     pylint

    #     # Others
    #     nodePackages.live-server

    #   ];

    # };

  };

#  xdg.configFile."nvim/lua/settings.lua".source = ./settings.lua;
#  xdg.configFile."nvim/lua/highlights.lua".source = ./highlights.lua;
#  xdg.configFile."nvim/lua/maps.lua".source = ./maps.lua;
#  xdg.configFile."nvim/lua/plugins".source = ./plugins;
#
#  home.sessionVariables.EDITOR = "nvim";
}

