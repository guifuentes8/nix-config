{ pkgs, ... }:
{
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

  programs = {
    firefox = {
      package = pkgs.firefox-wayland;
    };
  };
}
