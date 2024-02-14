{ pkgs, ... }:

{
  imports = [

    # Global config (required)
    ./global
    ./features/desktop/bspwm.nix
    ./features/productivity
    ./features/music
    # ./features/video/davinci-resolve
  ];

}
