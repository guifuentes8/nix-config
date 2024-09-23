{ ... }:
let
  lanDomain = "192.168.0.10";
  vpnDomain = "100.72.62.112";
in {
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    openFirewall = true;
    settings = {
      theme = "dark";
      color = "slate";
      title = "Sun Server";
      background = {
        image = "https://wallpaperaccess.com/full/2995428.jpg";
        blur = "xl";
      };
      favicon =
        "https://img.icons8.com/?size=100&id=YPTOhlU4qO2D&format=png&color=000000";
      cardBlur = "3xl";
      headerStyle = "boxedWidgets";
      language = "en-US";
      hideVersion = true;
      statusStyle = "basic";
      useEqualHeights = true;
      disableCollapse = true;
      quicklaunch = {
        searchDescriptions = true;
        hideInternetSearch = true;
        showSearchSuggestions = true;
        hideVisitURL = true;
        provider = "duckduckgo";
      };
      layout = {
        Calendar = { };
        Media = {
          style = "row";
          columns = 3;
        };
        Development = {
          style = "row";
          columns = 2;
        };
        Documentation = { };
        Network = { };

      };
    };
    bookmarks = [
      {
        Developer = [
          {
            Github = [{
              abbr = "GH";
              href = "https://github.com/";
            }];

          }
          {
            Github2 = [{
              abbr = "GH";
              href = "https://github.com/";
            }];
          }
        ];
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
    services = [
      {
        Calendar = [{
          Calendar = {
            widget = {
              type = "calendar";
              view = "monthly";
              maxEvents = 100; # optional - defaults to 10
              showTime = true;
              timezone = "Africa/Dakar";
              previousDays = 3;
              integrations = [
                {
                  type = "ical";
                  url =
                    "http://${lanDomain}:9000/remote.php/dav/calendars/guifuentes8/nextcloud-calendar/?export";
                  name = "Nextcloud Calendar:";
                  color = "yellow";
                  params = { showName = true; };
                }
                {
                  type = "ical";
                  url =
                    "http://${lanDomain}:9000/remote.php/dav/calendars/guifuentes8/personal/?export";
                  name = "Nextcloud Tasks:";
                  color = "purple";
                  params = { showName = true; };
                }
              ];
            };
          };
        }];
      }
      {
        Development = [
          {
            Gitea = {
              icon =
                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Gitea_Logo.svg/2560px-Gitea_Logo.svg.png";
              description = "Git version";
              href = "http://${vpnDomain}:3100";
              siteMonitor = "http://${lanDomain}:3100";

            };
          }
          {
            Vscode = {
              icon =
                "https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/visual-studio-code-icon.png";
              description = "IDE editor";
              href = "http://${vpnDomain}:2000";
              siteMonitor = "http://${vpnDomain}:2000";
            };
          }
        ];
      }
      {
        Media = [
          {
            Nextcloud = {
              icon =
                "https://cdn.icon-icons.com/icons2/2699/PNG/512/nextcloud_logo_icon_168948.png";
              description = "Nextcloud storage";
              href = "http://${vpnDomain}:9000";
              siteMonitor = "http://${lanDomain}:9000";
              widget = {
                type = "nextcloud";
                url = "http://${lanDomain}:9000";
                username = "guifuentes8";
                password = "oGJD6-DgdFr-3twDH-kWkFN-kpTLb";
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
            Jellyfin = {
              icon =
                "https://dl.flathub.org/media/com/github/iwalton3.jellyfin-media-player/20eebaca475a7aa1b2511bed6a86abeb/icons/128x128@2/com.github.iwalton3.jellyfin-media-player.webp";
              description = "Movies and music player";
              href = "http://${vpnDomain}:8096/web/#/home.html";
              siteMonitor = "http://${lanDomain}:8096/";
              widget = {
                type = "jellyfin";
                url = "http://${lanDomain}:8096";
                key = "236c9c7f8fe24e129f64718d6429ec56";
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
            Transmission = {
              icon =
                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Transmission_Icon.svg/2048px-Transmission_Icon.svg.png";
              description = "Torrent server";
              href = "http://${vpnDomain}:9091";
              siteMonitor = "http://192.168.0.10:9091/";
              widget = {
                type = "transmission";
                url = "http://192.168.0.10:9091";
                rpcUrl = "/transmission/";
                fields = [ "leech" "download" "upload" "seed" ];
              };

            };
          }

        ];
      }
      {
        Documentation = [{
          Bookstack = {
            href = "http://${vpnDomain}:4000";
            icon =
              "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/BookStack_logo.svg/2151px-BookStack_logo.svg.png";
            description = "Organising and storing information as a Library.";
            siteMonitor = "http://${lanDomain}:4000";
          };

        }];
      }

      {
        Network = [{
          Tailscale = {
            icon =
              "https://static.macupdate.com/submission/473953/d/phpapubfc-logo.png";
            description = "Torrent server";
            siteMonitor = "http://${vpnDomain}";
          };

        }];
      }
    ];
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
          showSearchSuggestions = true;
          focus = true;
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

