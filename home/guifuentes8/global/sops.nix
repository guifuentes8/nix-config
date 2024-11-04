{ config, ... }: {
  sops.age.keyFile = "/home/guifuentes8/.config/sops/age/keys.txt";

  sops.defaultSopsFile = ../../../secrets/secrets.yaml;
  # sops.defaultSopsFormat = "yaml";
  sops.defaultSymlinkPath = "/run/user/1000/secrets";
  sops.defaultSecretsMountPoint = "/run/user/1000/secrets.d";

  sops.secrets = {
    github_token = { path = "${config.sops.defaultSymlinkPath}/github_token"; };
    # "a/b/c/secret_file_example" = {};
  };
  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
}

