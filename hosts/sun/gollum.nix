{ ... }: {

  services.gollum = {
    enable = true;
    stateDir = "/var/lib/storage/gollum";
    port = 9004;
    emoji = true;
    allowUploads = "page";
  };
}
