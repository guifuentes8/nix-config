{ pkgs, ... }:

{
  imports = [

    # Global config (required)
    ./global
    ./features/dev
    ./features/dev/mobile.nix
    ./features/music
    ./features/productivity
    ./features/desktop/bspwm.nix
    ./features/desktop/common

    # ./features/video/davinci-resolve
  ];

}
