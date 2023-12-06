# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'


{ pkgs ? (import ../nixpkgs.nix) { } }: {
  shotcut = pkgs.callPackage ./shotcut { };
  kyoto-gtk-theme = pkgs.callPackage ./gtk-theme/kyoto-night { };
  sddm-theme = pkgs.callPackage ./sddm-theme { };
  ytermusic = pkgs.callPackage ./ytermusic { };
  my-config = pkgs.callPackage ./my-config { };
}
