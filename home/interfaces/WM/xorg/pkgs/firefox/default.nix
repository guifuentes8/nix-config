{ pkgs, ... }:
{
  programs = {
    firefox = {
      package = pkgs.firefox;
    };
  };
}
