{ pkgs, config, unstable, outputs, lib, ... }:
let
  cursorName = "everforest-cursors";
  cursorPkg = outputs.packages.${pkgs.system}.everforest-cursors;

in {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme =
      "${unstable.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    cursor = {
      name = cursorName;
      package = cursorPkg;
      size = 32;
    };
    fonts = {
      #packages = [ outputs.packages.${pkgs.system}.monolisa ];
      monospace = {
        #name = "JetBrainsMonoNL Nerd Font";
        name = "MonoLisa";
        package = outputs.packages.${pkgs.system}.monolisa;
        #    package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
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
      vim.enable = true;
      vscode.enable = false;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = lib.mkForce pkgs.papirus-icon-theme;
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

  #  home.file.".local/share/fonts/MonoLisa" = {
  #    recursive = true;
  #    source = "/home/guifuentes8/Nextcloud/Documents/Fonts/MonoLisa";
  #  };

}

