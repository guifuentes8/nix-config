{ ... }: {
  imports = [

    # Global config (required)
    ../guifuentes8
    ../modules/features/interfaces/DE/cinnamon.nix

  ];

  stylix.image = ../modules/common/extras/mercury.jpg;

}
