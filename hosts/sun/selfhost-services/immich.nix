{ pkgs, ... }: {
  services.immich = {
    enable = true;
    port = 9006;
    openFirewall = true;
    mediaLocation = "/var/lib/storage/immich";
    accelerationDevices = null;
  };
  users.users.immich.extraGroups = [ "video" "render" ];
  environment.systemPackages = [ pkgs.immich-cli ];
}
