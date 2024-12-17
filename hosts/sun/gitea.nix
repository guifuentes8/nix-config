{
  services.gitea = {
    enable = true;
    stateDir = "/mnt/storage/gitea";
    settings = {
      server = { HTTP_PORT = 9000; };
      service = { DISABLE_REGISTRATION = true; };

    };
  };
}
