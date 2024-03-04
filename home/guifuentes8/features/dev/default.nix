{ pkgs, outputs, ... }:
let dbgate = outputs.packages.${pkgs.system}.dbgate;
in {
  imports = [ ./neovim ./languages ./firefox-dev.nix ./vscode.nix ];

  home.packages = [ dbgate pkgs.insomnia ];
}

