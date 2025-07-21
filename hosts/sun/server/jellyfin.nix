{ pkgs, ... }: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "g8";
  };
  environment.systemPackages =
    [ pkgs.jellyfin pkgs.jellyfin-web pkgs.jellyfin-ffmpeg ];
}
