{ pkgs, outputs, unstable, ... }:
let
  dbgate = outputs.packages.${pkgs.system}.dbgate;
  warpp = outputs.packages.${pkgs.system}.warp-terminal;
in {
  imports = [ ./neovim ./languages ./vscode.nix ];

  home.packages =
    [ dbgate pkgs.firefox-devedition-bin pkgs.insomnia unstable.warp-terminal ];

}

