{ pkgs, unstable, lib, outputs, theme, nix-colors, ... }:
let
  cursor-name = "Catppuccin-Macchiato-Dark-Cursors";
  cursor-pkg = pkgs.catppuccin-cursors.macchiatoDark;
  cursor-size = 36;
  cursor-size-text = "36";
in {
  home.pointerCursor = {
    name = cursor-name;
    package = cursor-pkg;
    size = cursor-size;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    cursorTheme = {
      name = cursor-name;
      package = cursor-pkg;
      size = cursor-size;
    };
  };

}

