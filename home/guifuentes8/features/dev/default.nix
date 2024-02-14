{ pkgs, outputs, ... }:
let dbgate = outputs.packages.${pkgs.system}.dbgate;
in {
  imports = [ ./neovim ./languages ./vscode.nix ];

  home.packages = [ dbgate pkgs.insomnia ];
}

