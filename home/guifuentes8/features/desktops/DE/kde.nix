{ pkgs, ... }: {
  imports = [
    ./common
    ../../browsers/firefox.nix
    ../../terminals/kitty.nix
    ../../cli
    ../../programs
    ../../services
  ];

}
