{ config, inputs, outputs, pkgs, ... }: {

  imports = [ ../../common ];

  users.users.droid = {
    name = "droid";
    home = "/home/droid";
  };

  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-linux";

  nix = {
    linux-builder.enable = false;
    settings = {
      trusted-users = [ "@admin" "droid" "root" "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
    gc.automatic = true;
    extraOptions = ''
      extra-platforms = x86_64-linux x86_64-darwin aarch64-darwin
    '';
  };

}
