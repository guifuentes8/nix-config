{ pkgs, unstable, lib, ... }:
let
  cursorName = "phinger-cursors-dark";
  cursorPkg = pkgs.phinger-cursors;

in {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme =
      "${unstable.base16-schemes}/share/themes/catppuccin-mocha.yaml";
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
    cursorTheme = {
      name = cursorName;
      package = cursorPkg;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = "32";
  };
}

