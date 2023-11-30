{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sptlrx
  ];
  xdg.configFile."sptlrx/config.yaml".source = ./config.yaml;
}
