{ ... }: {
  imports = [

    # Global config (required)
    ./users/g8.nix

    ./modules/features/dev
    ./modules/features/neovim
    ./modules/features/terminals/kitty.nix

  ];

}

