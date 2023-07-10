{ pkgs, outputs, ... }:
let
  moosync = outputs.packages.${pkgs.system}.moosync;
in
{
  home.packages = with pkgs;
    [
      bitwarden
      moosync
    ];
}
