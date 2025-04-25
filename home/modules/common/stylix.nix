{ pkgs, lib, inputs, ... }:
let
  cursorName = "phinger-cursors-light";
  cursorPkg = pkgs.phinger-cursors;

in {

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.unstable.base16-schemes}/share/themes/ayu-dark.yaml";
    cursor = {
      name = cursorName;
      package = cursorPkg;
      size = 32;
    };
    fonts = {
      monospace = {
        name = "MonoLisa";
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
    };
    targets = {
      xfce.enable = lib.mkIf (pkgs.stdenv.hostPlatform.isLinux) true;
      nixvim.enable = false;
      vim.enable = true;
      vscode.enable = false;
    };
  };

  gtk = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = pkgs.unstable.catppuccin-papirus-folders;

    };
    cursorTheme = {
      name = cursorName;
      size = 32;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = "32";
  };

}
