{
  services.openvscode-server = {
    enable = true;
    port = 9094;
    user = "guifuentes8";
    group = "root";
    host = "0.0.0.0";
    withoutConnectionToken = true;
    telemetryLevel = "off";
  };
}
