{ pkgs, inputs, ... }: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    package = pkgs.vimPlugins.nvim-treesitter;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
    # 24.11
    #settings = {
    #auto_install = false;
    #autotag = true;
    #ensure_installed = "all";
    ensureInstalled = "all";
    # highlight = {
    #   additional_vim_regex_highlighting = true;
    #   custom_captures = { };
    #   disable = [ ];
    #   enable = true;
    # };
    #ignore_install = [ ];
    ignoreInstall = [ ];
    # incremental_selection = {
    #   enable = true;
    #   keymaps = {
    #     init_selection = false;
    #     node_decremental = "grm";
    #     node_incremental = "grn";
    #     scope_incremental = "grc";
    #   };
    # };
    indent = { enable = true; };
    # parser_install_dir = {
    #   parserInstallDir = {
    #     __raw = "vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')";
    #   };
    #   sync_install = false;
    #};
  };
}
