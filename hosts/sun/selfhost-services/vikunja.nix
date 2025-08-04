{ ... }: {
  services.vikunja = {
    enable = true;
    port = 9112;
    frontendScheme = "http";
    frontendHostname = "sun.mau-becrux.ts.net";
  };
}
