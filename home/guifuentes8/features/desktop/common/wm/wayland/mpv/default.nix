{ pkgs, config, lib, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto";
      vo = "gpu";
      profile = "gpu-hq";
      gpu-context = "wayland";
      ytdl-format = "bestvideo+bestaudio";
      background = lib.mkDefault "#${config.colorScheme.colors.base00}";
      alpha = "yes";
    };
    defaultProfiles = [ "gpu-hq" ];
    scripts = [ pkgs.mpvScripts.mpris ];
  };
}
