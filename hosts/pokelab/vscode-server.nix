{
  services.openvscode-server = {
    enable = true;
    port = 2000;
    user = "guifuentes8";
    group = "root";
    host = "127.0.0.1";
    withoutConnectionToken = true;
    telemetryLevel = "off";
  };
}
