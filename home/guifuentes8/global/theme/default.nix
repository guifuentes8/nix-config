{ pkgs, unstable, lib, outputs, theme, nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default
    ./gtk.nix
    ./cursor.nix
    ./icon.nix
    ./qt.nix
  ];

  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;
  # colorScheme = nix-colors.lib.schemeFromYAML "oxocarbon"
  #  (builtins.readFile ./oxocarbon.yaml);
}

