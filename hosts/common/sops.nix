{ config, pkgs, ... }: {
  sops = {
    defaultSopsFile = ../../secrets/g8.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/g8/.config/sops/age/keys.txt";
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    age.generateKey = true;
    secrets = {
      github-token = { };
      postiz-jwt = { };
      postiz-db = { };
      postiz-db-user = { };
      postiz-db-password = { };
      postiz-yt-id = { };
      postiz-yt-secret = { };
      postiz-face-id = { };
      postiz-face-secret = { };
      postiz-tiktok-id = { };
      postiz-tiktok-secret = { };
      postiz-linkedin-id = { };
      postiz-linkedin-secret = { };

    };
  };

  environment = { systemPackages = with pkgs; [ sops ]; };
}
