{ pkgs, config, ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets/common.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "${config.users.users.g8-fuentes.home}/.config/sops/age/keys.txt";
    age.generateKey = true;
    age.sshKeyPaths = [ ];
    secrets = {
      github-token = { };
    };
  };

  environment = {
    systemPackages = with pkgs; [ sops ];
  };
}
