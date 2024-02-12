{ pkgs, ... }:

{
  imports = [

    # Global config (required)
    ./global
    ./features/desktop/bspwm.nix
    ./features/productivity
    # ./features/video/davinci-resolve
  ];

}
