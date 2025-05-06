{ config, inputs, lib, outputs, pkgs, ... }: {

  #imports = [ ../../common ];

  #  nix = {
  #    settings = {
  #      trusted-users = [ "droid" "@admin" "root" "@wheel" ];
  #      experimental-features = [ "nix-command" "flakes" ];
  #      warn-dirty = false;
  #    };
  #    #  optimise.automatic = true;
  #  };

  time.timeZone = lib.mkDefault "America/Sao_Paulo";

  #----
}
