{ nix-colors, ... }: {
  imports = [

    # Global config (required)
    ./common

    ./features/cli
    ./features/dev
    ./features/music
    ./features/neovim
    ./features/video
    ./features/desktop/WM/hyprland.nix

    # ./features/video/davinci-resolve

    nix-colors.homeManagerModules.default

  ];
  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

}
