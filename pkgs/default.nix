# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {

  dbgate = pkgs.callPackage ./dbgate { };
  doist = pkgs.callPackage ./doist { };
  shotcut = pkgs.callPackage ./shotcut { };
  gtk_theme = pkgs.callPackage ./gtk_theme/material { };
  sddm_theme = pkgs.callPackage ./sddm_theme { };
  ytermusic = pkgs.callPackage ./ytermusic { };
}
