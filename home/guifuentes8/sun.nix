{ ... }: {
  imports = [

    # Global config (required)
    ../guifuentes8

    ../modules/features/dev
    ../modules/features/neovim

  ];

  stylix.image = ../modules/common/extras/earth.jpeg;

}

