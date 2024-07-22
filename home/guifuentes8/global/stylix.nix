{ pkgs, unstable, lib, ... }:
let cursorName = "Catppuccin-Mocha-Dark-Cursors";
in {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme =
      "${unstable.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    cursor = {
      name = cursorName;
      package = pkgs.catppuccin-cursors;
      size = 32;
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
      package = lib.mkForce pkgs.catppuccin-papirus-folders;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = "30";
  };

}

