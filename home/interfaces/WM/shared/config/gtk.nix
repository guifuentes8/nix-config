{ pkgs, lib, outputs, ... }:
let material-gtk-theme = outputs.packages.${pkgs.system}.material-gtk-theme;
in
{
  gtk = {
    enable = true;
    font = {
      name = lib.mkForce "JetBrainsMonoNL Nerd Font";
      size = lib.mkForce 13;
    };
    cursorTheme = {
      name = lib.mkForce "Bibata-Modern-Ice";
      package = lib.mkForce pkgs.bibata-cursors;
      size = lib.mkForce 24;
    };
    iconTheme = {
      name = lib.mkForce "Colloid";
      package = lib.mkForce pkgs.colloid-icon-theme;
    };
    theme = {
      name = lib.mkForce "Sweet-Dark";
      package = pkgs.sweet;
    };
  };
}
