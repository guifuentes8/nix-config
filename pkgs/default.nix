# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  dbgate = pkgs.callPackage ./dbgate { };
  zen-browser = pkgs.callPackage ./zen-browser { };
  everforest-cursors = pkgs.callPackage ./everforest-cursors { };
}
