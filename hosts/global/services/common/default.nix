{ pkgs, ... }: {
  imports = [ ./firewall.nix ./gnomeKeyring.nix ./kdeConnect.nix ];

}
