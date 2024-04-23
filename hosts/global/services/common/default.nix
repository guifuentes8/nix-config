{ pkgs, ... }: {
  imports =
    [ ./firewall.nix ./gnomeKeyring.nix ./nextcloud.nix ./kdeConnect.nix ];
}
