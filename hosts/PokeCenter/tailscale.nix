{ unstable, lib, ... }: {

  services.tailscale = {
    enable = true;
    package = lib.mkForce unstable.tailscale;
    openFirewall = true;
    useRoutingFeatures = lib.mkForce "server";
  };

}
