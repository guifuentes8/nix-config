# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'


{ pkgs ? (import ../nixpkgs.nix) { } }: {
  sddm-theme = pkgs.callPackage ./sddm-theme { };
  slack-term2 = pkgs.callPackage ./slack-term { };
  spotify-player = pkgs.callPackage ./spotify-player { };
  wf-recorder2 = pkgs.callPackage ./wf-recorder2 { };
}
