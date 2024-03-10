{ pkgs, outputs, unstable, ... }:
let
  dbgate = outputs.packages.${pkgs.system}.dbgate;
  warpp = outputs.packages.${pkgs.system}.warp-terminal;
in {
  imports = [ ./neovim ./languages ./firefox-dev.nix ./vscode.nix ];

  home.packages = [
    dbgate
    pkgs.insomnia
    #unstable.warp-terminal
    # warp-term
    warpp
  ];

}

