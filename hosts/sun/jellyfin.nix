{ pkgs, ... }: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "guifuentes8";
  };
  environment.systemPackages =
    [ pkgs.jellyfin pkgs.jellyfin-web pkgs.jellyfin-ffmpeg ];
}
