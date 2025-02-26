{ config, inputs, outputs, pkgs, ... }:
let nh_plus = inputs.nh_plus.packages."aarch64-darwin".nh;
in {

  imports = [ ../common/users/darwin.nix ];
  environment = { systemPackages = with pkgs; [ nh_plus ]; };

  homebrew = {
    enable = true;
    casks = [ "nextcloud" ];
  };
  networking = { hostName = "darwin"; };

}
