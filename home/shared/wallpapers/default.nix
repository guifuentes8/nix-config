{ outputs, pkgs, ... }:
let
  my-config = outputs.packages.${pkgs.system}.my-config;
in
{
  home.file.".config/wallpapers" = {
    recursive = true;
    source = "${my-config}/wallpapers";
  };

}
