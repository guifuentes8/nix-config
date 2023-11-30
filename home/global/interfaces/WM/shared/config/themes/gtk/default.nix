{ pkgs, unstable, lib, outputs, ... }:
let
  catppuccin_name = "Catppuccin-Mocha-Standard-Blue-Dark";
  catppuccin_gtk = unstable.catppuccin-gtk.override {
    accents = [ "blue" ]; # You can specify multiple accents here to output multiple themes
    size = "standard";
    tweaks = [ "rimless" ]; # You can also specify multiple tweaks here
    variant = "mocha";
  };
in
{
  gtk = {
    enable = true;
    font = {
      name = lib.mkForce "JetBrainsMonoNL Nerd Font";
      size = lib.mkForce 13;
    };
    cursorTheme = {
      name = lib.mkForce "phinger-cursors-light";
      package = lib.mkForce unstable.phinger-cursors;
      size = lib.mkForce 32;
    };
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = lib.mkForce unstable.catppuccin-papirus-folders;
    };
    theme = {
      name = lib.mkForce "${catppuccin_name}";
      package = catppuccin_gtk;
    };
  };

  home.file.".config/gtk-4.0/gtk.css".source = "${catppuccin_gtk}/share/themes/${catppuccin_name}/gtk-4.0/gtk-dark.css";
  home.file.".config/gtk-4.0/assets" = {
    recursive = true;
    source = "${catppuccin_gtk}/share/themes/${catppuccin_name}/gtk-4.0/assets";
  };
  home.sessionVariables.GTK_THEME = "${catppuccin_name}";
}
