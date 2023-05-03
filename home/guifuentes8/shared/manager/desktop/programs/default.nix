{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden
    mattermost-desktop
    slack
    spotify
  ];
}
