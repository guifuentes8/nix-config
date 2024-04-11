{ pkgs, configOptions, ... }: {
  imports = [

    # Global config (required)
    ./global
    ./features/dev
    ./features/dev/mobile.nix
    ./features/music
    ./features/productivity
    ./features/desktop/hyprland.nix
    ./features/desktop/common

    # ./features/video/davinci-resolve

  ];
}
