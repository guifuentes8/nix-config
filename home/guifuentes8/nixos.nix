{ pkgs, ... }:

{
  imports = [

    # Global config (required)
    ./global
    ./features/desktop/bspwm.nix
    ./features/dev
    ./features/dev/mobile.nix
    ./features/productivity
    ./features/music
    # ./features/video/davinci-resolve
  ];

}
