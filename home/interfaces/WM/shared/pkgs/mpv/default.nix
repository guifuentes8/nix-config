{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
      ytdl-format = "bestvideo+bestaudio";
    };
    defaultProfiles = [ "gpu-hq" ];
    scripts = [ pkgs.mpvScripts.mpris ];
  };
}
