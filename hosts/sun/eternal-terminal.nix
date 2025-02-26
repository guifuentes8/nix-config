{ ... }: {
  services.eternal-terminal = {
    enable = true;
    port = 9005;
    #   openFirewall = true;
  };
}
