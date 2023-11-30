# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'


{ pkgs ? (import ../nixpkgs.nix) { } }: {
  shotcut = pkgs.callPackage ./shotcut { };
  material-gtk-theme = pkgs.callPackage ./gtk-theme/material { };
  lavanda-gtk-theme = pkgs.callPackage ./gtk-theme/lavanda { };
  sddm-theme = pkgs.callPackage ./sddm-theme { };
  ytermusic = pkgs.callPackage ./ytermusic { };
  my-config = pkgs.callPackage ./my-config { };
}
