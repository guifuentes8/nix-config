{ pkgs, ... }:
{

  home.packages = with pkgs;
    [
      matterhorn
    ];
  xdg.configFile."matterhorn/config.ini".source = ./config.ini;
  xdg.configFile."matterhorn/notify.sh".source = ./notify.sh;

}
