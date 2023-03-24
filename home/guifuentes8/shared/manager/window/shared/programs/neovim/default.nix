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


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = ''
    
    " Global Sets """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    syntax on            " Enable syntax highlight
    set nu               " Enable line numbers
    set tabstop=4        " Show existing tab with 4 spaces width
    set softtabstop=4    " Show existing tab with 4 spaces width
    set shiftwidth=4     " When indenting with '>', use 4 spaces width
    set expandtab        " On pressing tab, insert 4 spaces
    set smarttab         " insert tabs on the start of a line according to shiftwidth
    set smartindent      " Automatically inserts one extra level of indentation in some cases
    set hidden           " Hides the current buffer when a new file is openned
    set incsearch        " Incremental search
    set ignorecase       " Ingore case in search
    set smartcase        " Consider case if there is a upper case character
    set scrolloff=8      " Minimum number of lines to keep above and below the cursor
    set colorcolumn=150  " Draws a line at the given line to keep aware of the line size
    set signcolumn=yes   " Add a column on the left. Useful for linting
    set cmdheight=2      " Give more space for displaying messages
    set updatetime=100   " Time in miliseconds to consider the changes
    set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
    set nobackup         " No backup files
    set nowritebackup    " No backup files
    set splitright       " Create the vertical splits to the right
    set splitbelow       " Create the horizontal splits below
    set autoread         " Update vim after file update from outside
    set mouse=a          " Enable mouse support
    filetype on          " Detect and set the filetype option and trigger the FileType Event
    filetype plugin on   " Load the plugin file for the file type, if any
    filetype indent on   " Load the indent file for the file type, if any

    " Themes """""""""""""""""""""""
    
    colorscheme catppuccin-macchiato



    " Remaps """"""""""
    " Shortcuts for split navigation
      map <C-h> <C-w>h
      map <C-j> <C-w>j
      map <C-k> <C-w>k
      map <C-l> <C-w>l


    " autocmd """"""""""
    " autocmds aqui



    " Airline """"""""""
    let g:airline_theme = 'catppuccin'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1



    " NerdTree """""""""
    nmap <C-a> :NERDTreeToggle<CR>



    " ALE """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      let g:ale_linters = {   
      \}    
          
      let g:ale_fixers = {    
      \   '*': ['trim_whitespace'],
      \}    
          
      let g:ale_fix_on_save = 1   


        '';
    extraLuaConfig = ''
    
        '';
    plugins = with pkgs.vimPlugins; [
      ale
      catppuccin-nvim
      nerdtree
      nerdtree-git-plugin
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      vim-nerdtree-syntax-highlight
      vim-devicons
      vim-airline
      vim-plug
      vim-polyglot
    ];

    coc = {
      enable = true;
      settings = { };
    };
  };

  #xdg.configFile."nvim/init.vim".source = ./init.vim;



}
