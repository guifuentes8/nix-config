{ pkgs, outputs, unstable, ... }:
let dbgate = outputs.packages.${pkgs.system}.dbgate;
in {
  imports = [ ./neovim ./languages ./vscode.nix ];

  home.packages =
    [ dbgate pkgs.firefox-devedition-bin pkgs.insomnia unstable.warp-terminal ];

}

