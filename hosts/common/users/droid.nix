{ config, inputs, lib, outputs, pkgs, ... }: {

  #imports = [ ../../common ];

  nix = {
    settings = {
      trusted-users = [ "droid" "@admin" "root" "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
    #  optimise.automatic = true;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [ ];
      pulseaudio = true;
    };
  };

  time.timeZone = lib.mkDefault "America/Sao_Paulo";

  programs.zsh.enable = true;
  #----
  users.users.droid = {
    name = "droid";
    home = "/home/droid";
  };

  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-linux";

}
