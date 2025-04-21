{ ... }: {
  imports = [

    # Global config (required)
    ./gui8.nix
    ./modules/features/interfaces/DE/cinnamon.nix

  ];

  stylix.image = ../modules/common/extras/mercury.jpg;

}
