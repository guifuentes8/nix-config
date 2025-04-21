{ ... }: {
  imports = [

    # Global config (required)
    ../gui8

    ../modules/features/dev
    ../modules/features/neovim

  ];

  stylix.image = ../modules/common/extras/earth.jpeg;

}

