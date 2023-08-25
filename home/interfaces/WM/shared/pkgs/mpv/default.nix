{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "nvdec";
      vo = "gpu";
      profile = "gpu-hq";
      # gpu-context = "wayland";
      ytdl-format = "bestvideo+bestaudio";
    };
    defaultProfiles = [ "gpu-hq" ];
    scripts = [ pkgs.mpvScripts.mpris ];
  };
}
