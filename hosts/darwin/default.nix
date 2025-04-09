{
  config,
  inputs,
  outputs,
  pkgs,
  ...
}:

{

  imports = [ ../common/users/darwin.nix ];

  networking = {
    hostName = "darwin";
  };
  system.stateVersion = 5;
  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix = {
    linux-builder.enable = false;
    settings = {
      trusted-users = [
        "@admin"
        "administrador"
        "root"
        "@wheel"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
    gc.automatic = true;
    extraOptions = ''
      extra-platforms = x86_64-linux x86_64-darwin aarch64-darwin
    '';
  };
}
