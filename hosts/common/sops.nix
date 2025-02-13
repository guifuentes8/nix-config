{ config, pkgs, ... }: {
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/Users/administrador/.config/sops/age/keys.txt";
  sops.secrets = { github_token = { }; };

  environment = { systemPackages = with pkgs; [ sops ]; };
}
