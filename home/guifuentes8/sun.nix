{ ... }: {
  imports = [

    # Global config (required)
    ./global
    ./features/neovim
    ./features/cli
  ];

  stylix.image = ./global/extras/earth.jpeg;

}

