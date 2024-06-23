{ config, ... }: {
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 8080;
    settings = { title = "My dashboard"; };
    services = [{
      "Services" = [
        {
          "Nextcloud" = {
            description = "Private cloud";
            href = "http://192.168.0.10:9000";
          };
        }
        {
          "Transmission" = {
            description = "Torrent server";
            href = "http://pokecenter:9091";
          };
        }
        {
          "Jellyfin" = {
            description = "Movies and music player";
            href = "http://pokecenter:8096/web/#/home.html";
          };
        }

      ];
    }];
  };

}

