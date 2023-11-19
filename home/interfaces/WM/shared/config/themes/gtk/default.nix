{ pkgs, unstable, lib, outputs, ... }:
let
  material-gtk-theme = outputs.packages.${pkgs.system}.material-gtk-theme;
  lavanda-gtk-theme = outputs.packages.${pkgs.system}.lavanda-gtk-theme;

in
{
  gtk = {
    enable = true;
    font = {
      name = lib.mkForce "JetBrainsMonoNL Nerd Font";
      size = lib.mkForce 13;
    };
    cursorTheme = {
      name = lib.mkForce "Phinger Cursors";
      package = lib.mkForce pkgs.phinger-cursors;
      size = lib.mkForce 32;
    };
    iconTheme = {
      name = lib.mkForce "BeautyLine";
      package = lib.mkForce pkgs.beauty-line-icon-theme;
    };
    theme = {
      name = lib.mkForce "Lavanda-Dark";
      package = lavanda-gtk-theme;
    };
  };

  home.file.".config/gtk-4.0/gtk.css".source = ./lavanda.css;
  home.file.".config/gtk-4.0/assets" = {
    recursive = true;
    source = "${lavanda-gtk-theme}/share/themes/src/assets";
  };
}
