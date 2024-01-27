{ pkgs, outputs, ... }:
let
  #my_config = outputs.packages.${pkgs.system}.my_config;
in {
  programs.wpaperd = { enable = true; };

  xdg.configFile."wpaperd/wallpaper.toml" = {
    text = ''
      [default]
      path = "TODO/share/wallpapers/wallpaper.png"
    '';
  };
}
