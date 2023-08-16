{ pkgs, nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = nix-colors.lib.schemeFromYAML "deepocean" (builtins.readFile ./deepocean.yaml);
}
