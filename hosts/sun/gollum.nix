{ ... }: {

  services.gollum = {
    enable = true;
    stateDir = "/mnt/storage/gollum";
    port = 9004;
    emoji = true;
    allowUploads = "page";
  };
}
