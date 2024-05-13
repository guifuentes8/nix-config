{ pkgs, ... }: {
  imports = [ ./dev ./firewall.nix ./gnomeKeyring.nix ./kdeConnect.nix ];

}
