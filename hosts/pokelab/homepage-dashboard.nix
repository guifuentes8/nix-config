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
            href = "http://pokelab:9000";
          };
        }
        {
          "Transmission" = {
            description = "Torrent server";
            href = "http://pokelab:9091";
          };
        }
        {
          "Jellyfin" = {
            description = "Movies and music player";
            href = "http://pokelab:8096/web/#/home.html";
          };
        }

      ];
    }];
  };

}

