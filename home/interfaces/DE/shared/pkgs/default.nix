{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden
    davinci-resolve
    mattermost-desktop
    spotify
  ];
}
