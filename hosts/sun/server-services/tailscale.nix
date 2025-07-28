{ pkgs, lib, ... }: {

  services.tailscale = {
    enable = true;
    package = lib.mkForce pkgs.unstable.tailscale;
    openFirewall = true;
    useRoutingFeatures = lib.mkForce "server";
    permitCertUid = "caddy";
  };

}
