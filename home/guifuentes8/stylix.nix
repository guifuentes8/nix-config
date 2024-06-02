{ pkgs, lib, outputs, ... }:
let everforest-cursors = outputs.packages.${pkgs.system}.everforest-cursors;
in {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    cursor = {
      name = "everforest-cursors";
      package = everforest-cursors;
      size = 32;
    };
    fonts = { };
    opacity = { };
    override = { };
    image = ./wallpaper.png;
    targets = {
      nixvim.enable = false;
      vim.enable = false;
      tmux.enable = true;
      vscode.enable = false;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Colloid-dark";
      package = lib.mkForce pkgs.colloid-icon-theme;
    };
  };
}

#scheme: "Everforest Dark Hard"
#author: "Oskar Liew (https://github.com/OskarLiew)"
#base00: "#272e33" # bg0,        Default background
#base01: "#2e383c" # bg1,        Lighter background
#base02: "#414b50" # bg3,        Selection background
#base03: "#859289" # grey1,      Comments
#base04: "#9da9a0" # grey2,      Dark foreground
#base05: "#d3c6aa" # fg,         Default foreground
#base06: "#e4e1cd" # bg3,        Light foreground
#base07: "#fdf6e3" # bg0,        Light background
#base08: "#7fbbb3" # blue
#base09: "#d699b6" # purple
#base0A: "#dbbc7f" # yellow
#base0B: "#83c092" # aqua
#base0C: "#e69875" # orange
#base0D: "#a7c080" # green
#base0E: "#e67e80" # red
#base0F: "#4C3743" # bg_visual
