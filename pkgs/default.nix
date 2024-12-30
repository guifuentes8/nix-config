# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  dbgate = pkgs.callPackage ./dbgate { };
  everforest-cursors = pkgs.callPackage ./everforest-cursors { };
  zen-browser = pkgs.callPackage ./zen-browser { };

}
