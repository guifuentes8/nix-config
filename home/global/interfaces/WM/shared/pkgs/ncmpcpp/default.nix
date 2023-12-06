{ config, pkgs, ... }:
let musicDir = "/home/guifuentes8/Music";
in
{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.xdg.userDirs.music}";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire"
      }
    '';
  };

  programs.ncmpcpp = {
    package = pkgs.ncmpcpp.override { visualizerSupport = true; };
    enable = true;
    mpdMusicDir = "${musicDir}";
  };
}
