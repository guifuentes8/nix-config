{ pkgs, ... }:
{
  home.file.".nchat" = {
    source = ./config;
    recursive = true;
  };
  home.packages = with pkgs;[
    nchat
  ];
}
