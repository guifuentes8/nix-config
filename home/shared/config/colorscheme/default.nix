{ pkgs, nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default
  ];
  colorScheme = nix-colors.lib.schemeFromYAML "vice" (builtins.readFile ./vice.yaml);

}
# scheme: "vice"
# author: "Thomas Leon Highbaugh thighbaugh@zoho.com"
# base00: "#17191E"
# base01: "#22262d"
# base02: "#3c3f4c"
# base03: "#383a47"
# base04: "#555e70"
# base05: "#8b9cbe"
# base06: "#B2BFD9" text-color
# base07: "#f4f4f7"
# base08: "#ff29a8" third
# base09: "#85ffe0" secondary
# base0A: "#f0ffaa"
# base0B: "#0badff"
# base0C: "#8265ff" main
# base0D: "#00eaff"
# base0E: "#00f6d9"
# base0F: "#ff3d81"

