{
  services.gitea = {
    enable = true;
    settings.server = { HTTP_PORT = 3100; };
  };
}
