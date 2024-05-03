# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {

  cursor_theme = pkgs.callPackage ./cursors/everforest { };
  dbgate = pkgs.callPackage ./dbgate { };
  gtk_theme = pkgs.callPackage ./gtk_theme/everforest { };
  shotcut = pkgs.callPackage ./shotcut { };
  sddm_theme = pkgs.callPackage ./sddm_theme { };
  warp-terminal = pkgs.callPackage ./warp-terminal { };
  ytermusic = pkgs.callPackage ./ytermusic { };
  nchat = pkgs.callPackage ./nchat { };
}
