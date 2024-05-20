{ pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [ tailscale ];
  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = lib.mkDefault "server";
  };

}
