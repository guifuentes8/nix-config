{ unstable, lib, ... }: {

  services.tailscale = {
    enable = true;
    package = unstable.tailscale;
    openFirewall = true;
    useRoutingFeatures = lib.mkDefault "server";
  };

}
