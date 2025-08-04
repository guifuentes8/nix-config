{ ... }:
let
  domain = "https://sun.mau-becrux.ts.net";
  localDomain = "127.0.0.1";
in {
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 9000;
    allowedHosts = "*";
    services = [{
      "Services" = [
        {
          "Seafile" = {
            icon =
              "https://manual.seafile.com/12.0/media/seafile-transparent-1024.png";
            description = "Files service";
            href = "${domain}:9001";
            siteMonitor = "${domain}:9001";
          };
        }
        {
          "Immich" = {
            icon =
              "https://play-lh.googleusercontent.com/nJsRIdtaot1-FKH3kiRem4kjqUU1-_0hd_64qZH0BgtzUecYfWLCDfpk2nNVul8hOrw=w240-h480-rw";
            description = "Photos service";
            href = "${domain}:9002";
            siteMonitor = "${domain}:9002";
          };
        }
        {
          "Radicale" = {
            icon =
              "https://www.cloudron.io/store/icons/org.radicale.cloudronapp2.png";
            description = "CalDav service";
            href = "${domain}:9003";
            siteMonitor = "${domain}:9003";
          };
        }
        {
          "Navidrome" = {
            icon = "https://avatars.githubusercontent.com/u/26692192?v=4";
            description = "Music service";
            href = "${domain}:9004";
            siteMonitor = "${domain}:9004";
          };
        }
        {
          "AudioBook Shelf" = {
            icon =
              "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Audiobookshelf_Logo.svg/2048px-Audiobookshelf_Logo.svg.png";
            description = "Audiobook + Podcast service";
            href = "${domain}:9005";
            siteMonitor = "${domain}:9005";
          };
        }
        {
          "Flat Notes" = {
            icon =
              "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/flatnotes/metadata/logo.jpg";
            description = "Note-taking service";
            href = "${domain}:9006";
            siteMonitor = "${domain}:9006";
          };
        }
        {
          "ConvertX" = {
            icon =
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhheyR18DT4a_JSZ7gBsrBxX9CC7U0lJ2Vug&s";
            description = "Convert images service";
            href = "${domain}:9007";
            siteMonitor = "${domain}:9007";
          };
        }
        {
          "MeTube" = {
            icon = "https://files.raycast.com/6w0l0p8m3uytgj1zc4bkssgalk05";
            description = "Youtube downloader service";
            href = "${domain}:9008";
            siteMonitor = "${domain}:9008";
          };
        }
        {
          "Karakeep" = {
            icon =
              "https://play-lh.googleusercontent.com/95d3e2a2-m4WVn7RYmdlOpdXJditxSpj4iVCF70aWPxJUQEP1HOdbiUg6L2GDOHfFV8";
            description = "Bookmarks service";
            href = "${domain}:9009";
            siteMonitor = "${domain}:9009";
          };
        }
        {
          "Vaultwarden" = {
            icon =
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQise_TS6EZCtz4EmSyIMEH5ZPAuQLrVEZgmQ&s";
            description = "Secrets service";
            href = "${domain}:9010";
            siteMonitor = "${domain}:9010";
          };
        }
        {
          "Vscode" = {
            icon =
              "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png";
            description = "Code editor service";
            href = "${domain}:9011";
            siteMonitor = "${domain}:9011";
          };
        }
        {
          "Vikunja" = {
            icon =
              "https://community.vikunja.io/uploads/default/original/1X/894bd400d7c5bde78a65ba02e326798ccfb82006.png";
            description = "Board and Tasks service";
            href = "${domain}:9012";
            siteMonitor = "${domain}:9012";
          };
        }
        {
          "Excalidraw" = {
            icon = "https://docs.excalidraw.com/img/logo.svg";
            description = "Draw service";
            href = "${domain}:9013";
            siteMonitor = "${domain}:9013";
          };
        }
      ];
    }];

    settings = {
      title = "G8 Sun server";
      description = "G8 sun homelab dashboard server!";
      background.image =
        "https://images2.alphacoders.com/538/thumb-1920-538932.jpg";
      cardBlur = "md";
      favicon = "https://cdn-icons-png.flaticon.com/512/12797/12797551.png";
      statusStyle = "basic";
      theme = "dark";
      layout = [{
        "Services" = {
          style = "row";
          columns = 4;
        };
      }];
    };
  };
}
