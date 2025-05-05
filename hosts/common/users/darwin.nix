{ config, inputs, outputs, pkgs, ... }: {

  imports = [ ../../common ];

  users.users.administrador = {
    name = "administrador";
    home = "/Users/administrador";
  };

  system.stateVersion = 5;
  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix = {
    linux-builder.enable = false;
    settings = {
      trusted-users = [ "@admin" "administrador" "root" "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
    gc.automatic = true;
    extraOptions = ''
      extra-platforms = x86_64-linux x86_64-darwin aarch64-darwin
    '';
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # cleanUp = "zap"; # 25.05
      upgrade = true;
    };
    casks = [
      "alfred"
      "bitwarden"
      "caffeine"
      "discord"
      "docker"
      "dbeaver-community"
      "flameshot"
      "gimp"
      "nextcloud"
      "onlyoffice"
      "obs"
      "vivaldi"
      "zoom"

    ];
  };

}
