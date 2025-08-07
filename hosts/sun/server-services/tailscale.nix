{ pkgs, lib, ... }: {

  services.tailscale = {
    enable = lib.mkDefault true;
    package = lib.mkDefault pkgs.unstable.tailscale;
    openFirewall = true;
    useRoutingFeatures = lib.mkDefault "server";
    permitCertUid = "caddy";
  };

}
