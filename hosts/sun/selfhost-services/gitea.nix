{
  services.gitea = {
    enable = true;
    stateDir = "/var/lib/storage/gitea";
    settings = {
      server = { HTTP_PORT = 9110; };
      service = { DISABLE_REGISTRATION = false; };

    };
    user = "g8";
  };
}
