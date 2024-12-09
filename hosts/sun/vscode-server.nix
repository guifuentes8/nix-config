{
  services.openvscode-server = {
    enable = true;
    port = 9001;
    user = "guifuentes8";
    group = "root";
    host = "0.0.0.0";
    withoutConnectionToken = true;
    telemetryLevel = "off";
  };
}
