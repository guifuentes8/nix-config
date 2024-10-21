{ ... }: {
  imports = [
    ./common
    ../../browsers/chromium.nix
    ../../terminals/alacritty.nix
    ../../terminals/warp.nix
    ../../cli
    ../../programs
    ../../services
  ];

}
