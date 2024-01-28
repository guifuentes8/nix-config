{ inputs, outputs, lib, config, pkgs, unstable, ... }:
let
  ytermusic = outputs.packages.${pkgs.system}.ytermusic;
  script = pkgs.writeShellScript "script" ''
    DIR="${config.home.homeDirectory}/.config/ytermusic"
    if [ ! -d "$DIR" ]; then
      mkdir -p $DIR
      touch $DIR/headers.txt
      ${pkgs.pass}/bin/pass show ytermusic/cookie > $DIR/headers.txt
    else
      ytermusic
    fi
  '';
in
{
  home.packages = [
    ytermusic
  ];

  home.file."headers.sh" = {
    enable = true;
    executable = true;
    text = ''${script}'';
    target = ".local/share/applications/headers.sh";
  };
}
