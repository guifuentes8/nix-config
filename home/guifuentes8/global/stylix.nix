{ pkgs, unstable, lib, ... }:
let
  cursorName = "Quintom_Ink";
  cursorPkg = pkgs.quintom-cursor-theme;

in {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme =
      "${unstable.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    cursor = {
      name = cursorName;
      package = cursorPkg;
      size = 32;
    };
    fonts = {
      monospace = {
        name = "JetBrainsMonoNL Nerd Font";
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 0.9;
      desktop = 1.0;
    };
    override = { };
    targets = {
      nixvim.enable = false;
      vim.enable = false;
      vscode.enable = false;
      waybar.enable = false;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = lib.mkForce pkgs.catppuccin-papirus-folders;
    };

  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = "32";
  };

  #  wayland.windowManager.hyprland.settings.env =
  #   [ "HYPRCURSOR_THEME,${cursorName}" "HYPRCURSOR_SIZE,32" ];

}

