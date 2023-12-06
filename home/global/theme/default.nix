{ pkgs, nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default
  ];
  colorScheme = nix-colors.lib.schemeFromYAML "everforest-dark-hard" (builtins.readFile ./kyotonight.yaml);
  # colorScheme = nix-colors.colorSchemes.everforest;

  #   scheme: "kyotonight"
  # author: "shrikecode"
  # base00: "#1a1b26"
  # base01: "#292e42"
  # base02: "#32344a"
  # base03: "#33467c"
  # base04: "#545c7e"
  # base05: "#a9b1d6"
  # base06: "#c0caf5"
  # base07: "#e4e4e5"
  # base08: "#f7768e"
  # base09: "#9ece6a"
  # base0A: "#e0af68"
  # base0B: "#7aa2f7"
  # base0C: "#ad8ee6"
  # base0D: "#73daca"
  # base0E: "#ff9e64"
  # base0F: "#db4b4b"
}

# name: Kyoto Night
# license: MIT
# author: Wojciech M. Wnuk <laniusone@pm.me>
# upstream: https://github.com/sigmavim/kyotonight/raw/master/extras/kitty/kyotonight.conf
#
# It's a mix of Tokyo Night Alacritty and Kitty themes by Folke Lemaitre
# Alacritty: https://github.com/folke/tokyonight.nvim/blob/main/extras/alacritty/tokyonight_night.yml
# Kitty: https://github.com/folke/tokyonight.nvim/raw/main/extras/kitty/tokyonight_night.conf

