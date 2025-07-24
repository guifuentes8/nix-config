{ ... }: {
  services.radicale = {
    enable = true;
    settings = {

      server.hosts = [ "localhost:9005" ];
      auth = {
        type = "htpasswd";
        htpasswd_filename = "/etc/radicale-users";
        htpasswd_encryption = "plain";
      };
      storage = {
        filesystem_folder = "/var/lib/storage/radicale/collections";
      };

    };
  };
  environment.etc."radicale-users" = {
    text = ''
      g8:Agorajaera@123
    '';

  };
}
