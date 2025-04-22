{
  services.gitea = {
    enable = true;
    stateDir = "/var/lib/storage/gitea";
    settings = {
      server = { HTTP_PORT = 9000; };
      service = { DISABLE_REGISTRATION = true; };

    };
    user = "guifuentes8";
  };
}
