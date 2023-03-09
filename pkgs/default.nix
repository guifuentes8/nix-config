# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  sddm-theme = pkgs.callPackage ./sddm-theme { };
  swww = pkgs.callPackage ./swww { };
  xgifwallpaper = pkgs.callPackage ./xgifwallpaper { };
}
