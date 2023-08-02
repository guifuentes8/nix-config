{ pkgs, outputs, ... }:
{
  home.packages = with pkgs;
    [
      bitwarden
      spotify
    ];
}
