{ pkgs, unstable, ... }: {
  imports =
    [ ./cava.nix ./ncmpcpp.nix ./ncspot.nix ./sptlrx.nix ./spotify-player.nix ];

  home.packages = [ pkgs.yewtube ];
}
