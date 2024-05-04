{ pkgs, ... }:

{
  imports = [

    # Global config (required)
    ./global
    ./features/dev
    ./features/music
    ./features/productivity
    ./features/desktop/hyprland.nix

    # ./features/video/davinci-resolve
  ];

}
