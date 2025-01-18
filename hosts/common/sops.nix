{ config, ... }: {
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/guifuentes8/.config/sops/age/keys.txt";
  sops.secrets = {
    github_token = { owner = "guifuentes8"; };
    # "a/b/c/secret_file_example" = {};
  };

  environment = {
    systemPackages = with pkgs; [ sops ];
  };
}
