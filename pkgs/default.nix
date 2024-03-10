# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {

  dbgate = pkgs.callPackage ./dbgate { };
  shotcut = pkgs.callPackage ./shotcut { };
  warp-terminal = pkgs.callPackage ./warp-terminal { };
  gtk_theme = pkgs.callPackage ./gtk_theme/material { };
  sddm_theme = pkgs.callPackage ./sddm_theme { };
  ytermusic = pkgs.callPackage ./ytermusic { };
}
