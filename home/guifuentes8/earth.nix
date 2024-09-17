{ ... }: {
  imports = [
    # Global config (required)
    ./global

    # Others configs
    ./features/dev
    ./features/neovim
    ./features/desktops/DE/kde.nix

  ];

  stylix.image = ./global/extras/earth.jpg;

}
