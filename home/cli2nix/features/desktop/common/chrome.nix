{ pkgs, ... }: {
  imports = [ ];
  programs = {
    chromium.enable = true;
    chromium.package = pkgs.google-chrome;
  };
}
