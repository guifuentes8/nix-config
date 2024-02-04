{ pkgs, unstable, lib, outputs, theme, nix-colors, ... }: {
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}

