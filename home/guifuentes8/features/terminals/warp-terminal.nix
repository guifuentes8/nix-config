{ pkgs, ... }:

{
  home.file.".local/share/warp-terminal/themes/tokyo_night_storm.yml".source =
    ./tokyo_night_storm.yml;
  home.packages = [ pkgs.warp-terminal ];

}
