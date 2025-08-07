{ config, pkgs, ... }: {
  sops.defaultSopsFile = ../../secrets/g8.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/g8/.config/sops/age/keys.txt";
  sops.secrets = { "g8/github/token" = { }; };

  environment = { systemPackages = with pkgs; [ sops ]; };
}
