{ ... }: {
  imports = [

    # Global config (required)
    ./users/guifuentes8.nix

    ./modules/features/dev
    ./modules/features/neovim

  ];

  programs.zsh.initContent = "pokeget pikachu --gmax";

}

