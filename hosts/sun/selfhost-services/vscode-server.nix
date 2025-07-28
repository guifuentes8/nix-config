{ pkgs, ... }: {
  services.openvscode-server = {
    enable = true;
    package = pkgs.unstable.openvscode-server;
    port = 9001;
    user = "g8";
    group = "root";
    host = "0.0.0.0";
    withoutConnectionToken = true;
    telemetryLevel = "off";
  };
}
