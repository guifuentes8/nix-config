{ pkgs, lib, ... }: {

  services.tailscale = {
    enable = true;
    package = lib.mkForce pkgs.tailscale;
    openFirewall = true;
    useRoutingFeatures = lib.mkForce "server";
  };

}
