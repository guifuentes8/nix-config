# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {

  dbgate = pkgs.callPackage ./dbgate { };
  shotcut = pkgs.callPackage ./shotcut { };
  cursor = pkgs.callPackage ./cursors/everforest { };
  gtk_theme = pkgs.callPackage ./gtk_theme/jasper { };
  sddm_theme = pkgs.callPackage ./sddm_theme { };
  ytermusic = pkgs.callPackage ./ytermusic { };
  my_config = pkgs.callPackage ./my_config { };
}
