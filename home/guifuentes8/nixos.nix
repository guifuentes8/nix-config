{ pkgs, ... }:

{
  imports = [

    # Global config (required)
    ./global
    ./global/nixpkgs
    ./features/desktop/bspwm.nix
    ./features/dev
    ./features/dev/mobile.nix
    ./features/productivity
    ./features/music
    # ./features/video/davinci-resolve
  ];

}
