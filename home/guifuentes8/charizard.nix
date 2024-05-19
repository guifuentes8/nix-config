{ nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default

    # Global config (required)
    ./common

    # Others configs
    ./features/dev
    ./features/desktop/kde.nix

    # ./features/video/davinci-resolve
  ];

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;
}
