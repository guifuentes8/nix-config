{
  services.openvscode-server = {
    enable = true;
    port = 2000;
    user = "root";
    group = "root";
    host = "0.0.0.0";
    withoutConnectionToken = true;
    telemetryLevel = "off";
  };
}
