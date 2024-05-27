{ pkgs, lib, outputs, ... }:
{
  stylix = {
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    cursor = {
      #name = "everforest-cursors";
      #package = everforest-cursors;
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

