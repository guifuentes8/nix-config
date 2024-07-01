{ ... }: {
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    openFirewall = true;
    settings = {
      theme = "dark";
      title = "Pokelab Server";
      background = "https://images3.alphacoders.com/103/1039168.png";
      favicon = "https://www.favicon.cc/favicon/939/942/favicon.ico";
      cardBlur = "md";
      headerStyle = "clean";
      language = "en-US";
      hideVersion = true;
      statusStyle = "basic";
      useEqualHeights = true;
      quicklaunch = {
        searchDescriptions = true;
        hideInternetSearch = true;
        showSearchSuggestions = true;
        hideVisitURL = true;
        provider = "duckduckgo";
      };
      layout = {
        Services = {
          style = "row";
          columns = 4;
        };
      };
    };
    bookmarks = [
      {
        Developer = [{
          Github = [{
            abbr = "GH";
            href = "https://github.com/";
          }];
        }];
      }
      {
        Entertainment = [{
          YouTube = [{
            abbr = "YT";
            href = "https://youtube.com/";
          }];
        }];
      }
    ];
    services = [{
      "Services" = [
        {
          "Nextcloud" = {
            icon =
              "https://cdn.icon-icons.com/icons2/2699/PNG/512/nextcloud_logo_icon_168948.png";
            description = "Nextcloud storage";
            href = "http://pokelab:9000";
            siteMonitor = "http://192.168.0.10:9000";
            widget = {
              type = "nextcloud";
              url = "http://192.168.0.10:9000";
              username = "guifuentes8";
              password = "y2FBC-7kWHG-W5r93-GsYME-kfnfb";
              fields = [
                "cpuload"
                "memoryusage"
                "freespace"
                "activeusers"
                "numfiles"
              ];
            };

          };
        }
        {
          "Transmission" = {
            icon =
              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Transmission_Icon.svg/2048px-Transmission_Icon.svg.png";
            description = "Torrent server";
            href = "http://pokelab:9091";
            siteMonitor = "http://192.168.0.10:9091/";
            widget = {
              type = "transmission";
              url = "http://192.168.0.10:9091";
              rpcUrl = "/transmission/";
              fields = [ "leech" "download" "upload" "seed" ];
            };

          };
        }
        {
          "Jellyfin" = {
            icon =
              "https://dl.flathub.org/media/com/github/iwalton3.jellyfin-media-player/20eebaca475a7aa1b2511bed6a86abeb/icons/128x128@2/com.github.iwalton3.jellyfin-media-player.webp";
            description = "Movies and music player";
            href = "http://pokelab:8096/web/#/home.html";
            siteMonitor = "http://192.168.0.10:8096/";
            widget = {
              type = "jellyfin";
              url = "http://192.168.0.10:8096";
              key = "6d1ae261116a4ea985ef7b89e92dc541";
              enableBlocks = true; # optional, defaults to false
              enableNowPlaying = true; # optional, defaults to true
              enableUser = true; # optional, defaults to false
              showEpisodeNumber = true; # optional, defaults to false
              expandOneStreamToTwoRows = false; # optional, defaults to true

              fields = [ "movies" "series" "episodes" "songs" ];
            };

          };

        }
        {
          "Tailscale" = {
            icon =
              "https://static.macupdate.com/submission/473953/d/phpapubfc-logo.png";
            description = "Torrent server";
            siteMonitor = "http://pokelab";
          };
        }
        {
          "Calendar" = {
            widget = {
              type = "calendar";
              view = "monthly";
              maxEvents = 100; # optional - defaults to 10
              showTime = true;
              timezone = "Africa/Dakar";
              previousDays = 3;
              integrations = [{
                type = "ical";
                url =
                  "http://192.168.0.10:9000/remote.php/dav/calendars/guifuentes8/personal/?export";
                name = "Personal:";
                color = "purple";
                params = { showName = true; };
              }];
            };

          };
        }
      ];
    }];
    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/";
          memory = true;
          cputemp = true;
          tempmin = 0; # optional, minimum cpu temp
          tempmax = 100; # optional, maximum cpu temp
          uptime = true;
          units = "metric"; # only used by cpu temp
          refresh = 200; # optional, in ms
          diskUnits =
            "bytes"; # optional, bytes (default) or bbytes. Only applies to disk

        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
      {
        openmeteo = {
          label = "Bauru"; # optional
          latitude = "-22.3147";
          longitude = "-49.0606";
          timezone = "America/Sao_Paulo"; # optional
          units = "metric"; # or imperial
          cache = 5;
          format = { maximumFractionDigits = 1; };
        };
      }
      {
        datetime = {
          locale = "pt-br";
          text_size = "xl";
          format = { timeStyle = "short"; };
        };
      }
    ];
  };

}

