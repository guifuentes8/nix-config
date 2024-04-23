{ pkgs, config, ... }: {
  environment.systemPackages = [ pkgs.nextcloud-client ];

  environment.etc."nextcloud-admin-pass".text =
    "$(${pkgs.pass}/bin/pass show nextcloud/secret)";

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "localhost";
    database.createLocally = true;
    config = {
      adminpassFile = "/etc/nextcloud-admin-pass";
      adminuser = "guifuentes8@gmail.com";
    };
    configureRedis = true;
    extraApps = {
      inherit (pkgs.nextcloud28Packages.apps) tasks mail calendar contacts;
    };
    extraAppsEnable = true;
    extraOptions.enabledPreviewProviders = [
      "OC\\Preview\\BMP"
      "OC\\Preview\\GIF"
      "OC\\Preview\\JPEG"
      "OC\\Preview\\Krita"
      "OC\\Preview\\MarkDown"
      "OC\\Preview\\MP3"
      "OC\\Preview\\OpenDocument"
      "OC\\Preview\\PNG"
      "OC\\Preview\\TXT"
      "OC\\Preview\\XBitmap"
      "OC\\Preview\\HEIC"
    ];
  };

  services.nginx = {
    enable = true;
    virtualHosts."${config.services.nextcloud.hostName}" = {
      listen = [{
        addr = "127.0.0.1";
        port = 8080;
      }];
    };
  };

}
