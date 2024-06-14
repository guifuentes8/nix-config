{ pkgs, lib, ... }:
let cursorName = "phinger-cursors-dark";
in {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    cursor = {
      name = cursorName;
      package = pkgs.phinger-cursors;
      size = 30;
    };
    fonts = {
      monospace = {
        name = "JetBrainsMonoNL Nerd Font";
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      };
    };
    opacity = {
      applications = 0.8;
      terminal = 0.85;
      desktop = 0.8;
    };
    override = { };
    image = ./extras/wallpaper.png;
    targets = {
      nixvim.enable = false;
      vim.enable = false;
      vscode.enable = false;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = lib.mkForce pkgs.papirus-icon-theme;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = "30";
  };
}

