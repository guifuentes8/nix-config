{ pkgs, outputs, ... }:
let
  my-config = outputs.packages.${pkgs.system}.my-config;
in
{
  programs.wpaperd = {
    enable = true;
  };

  xdg.configFile."wpaperd/wallpaper.toml" = {
    text = ''
      [default]
      path = "${my-config}/share/wallpapers/wallpaper.png"
    '';
  };
}
