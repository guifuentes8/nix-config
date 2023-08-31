{ pkgs, nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default
  ];
  colorScheme = nix-colors.lib.schemeFromYAML "deepocean" (builtins.readFile ./deepocean.yaml);

  #scheme: "DeepOcean"
  # base00: "#84FFFF" #main
  # base01: "#0F111A" #background
  # base02: "#090B10" #alt-background
  # base03: "#464B5D"
  # base04: "#3B3F51"
  # base05: "#717CB4"
  # base06: "#A6ACCD"
  # base07: "#EEFFFF" #text
  # base08: "#F07178"
  # base09: "#C3E88D"
  # base0A: "#FFCB6B"
  # base0B: "#82AAFF"
  # base0C: "#B0C9FF"
  # base0D: "#89DDFF"
  # base0E: "#C792EA" #secondary
  # base0F: "#F78C6C"
}
