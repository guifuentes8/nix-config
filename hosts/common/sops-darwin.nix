{ config, pkgs, ... }:
{
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/Users/administrador/.config/sops/age/keys.txt";
  sops.secrets = {
    github_token = {
      path = "${config.sops.defaultSymlinkPath}/github_token";
    };
  };

  environment = {
    systemPackages = with pkgs; [ sops ];
  };
}
