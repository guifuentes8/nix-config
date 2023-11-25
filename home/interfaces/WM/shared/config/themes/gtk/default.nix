{ pkgs, unstable, lib, outputs, ... }:
let catppuccin_name = "Catppuccin-Frappe-Standard-Blue-Dark";
in
{
  gtk = {
    enable = true;
    font = {
      name = lib.mkForce "JetBrainsMonoNL Nerd Font";
      size = lib.mkForce 13;
    };
    cursorTheme = {
      name = lib.mkForce "Catppuccin-Frappe-Dark";
      package = lib.mkForce unstable.catppuccin-cursors.frappeDark;
      size = lib.mkForce 32;
    };
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = lib.mkForce unstable.catppuccin-papirus-folders;
    };
    theme = {
      name = lib.mkForce "${catppuccin_name}";
      package = unstable.catppuccin-gtk;
    };
  };

  home.file.".config/gtk-4.0/gtk.css".source = "${unstable.catppuccin-gtk}/share/themes/${catppuccin_name}gtk-4.0/gtk-dark.css";
  home.file.".config/gtk-4.0/assets" = {
    recursive = true;
    source = "${unstable.catppuccin-gtk}/share/themes/${catppuccin_name}gtk-4.0/assets";
  };
  home.sessionVariables.GTK_THEME = "${catppuccin_name}";
}
