{ pkgs, unstable, lib, outputs, theme, nix-colors, ... }: {
  imports = [ nix-colors.homeManagerModules.default ];

  colorScheme = nix-colors.colorSchemes.tokyo-night-dark;
  #colorScheme = nix-colors.lib.schemeFromYAML "oxocarbon"
  #  (builtins.readFile ./oxocarbon.yaml);
}

