{ config, ... }: {
  imports = [ ];
  sops.age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

  sops.defaultSopsFile = ../../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.secrets = {
    github_token = {
      path = "${config.sops.defaultSymlinkPath}/g8/github/token";
    };
  };
  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
}
