{ ... }:
let domain = "guifuentes8.com.br";
in {
  services.homepage-dashboard = {
    enable = true;
    listenPort = 9030;
    openFirewall = true;
    settings = {
      theme = "dark";
      color = "slate";
      title = "guifuentes8 Server";
      background = {
        image = "https://images5.alphacoders.com/102/1026844.jpg";
        blur = "md";
      };
      favicon = "https://cdn-icons-png.flaticon.com/512/4682/4682341.png ";
      cardBlur = "2xl";
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
        provider = "google";
      };
      layout = {
        Development = {
          style = "row";
          columns = 3;
        };
        Personal = {
          style = "row";
          columns = 3;
        };
        Public = {
          style = "row";
          columns = 3;
        };
        Utils = {
          style = "row";
          columns = 3;
        };
      };
    };
    services = [
      {
        Development = [
          {
            CloudBeaver = {
              icon =
                "https://dbeaver.com/wp-content/uploads/2022/12/cloudbeaver_logo.png";
              description = ''
                Cloud Database Manager - Community Edition.
                CloudBeaver is a web server that provides a rich web interface. The server itself is a Java application, and the web part is written in TypeScript and React.'';
              href = "https://db.${domain}";
              siteMonitor = "https://db.${domain}";
            };
          }
          {
            Excalidraw = {
              href = "https://draw.${domain}";
              icon =
                "https://images.seeklogo.com/logo-png/54/2/excalidraw-logo-png_seeklogo-548100.png?v=638700694670000000";
              description =
                "Excalidraw is a virtual collaborative whiteboard tool that lets you easily sketch diagrams that have a hand-drawn feel to them.";
              siteMonitor = "https://draw.${domain}";
            };
          }
          {
            Gitea = {
              icon =
                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Gitea_Logo.svg/2560px-Gitea_Logo.svg.png";
              description =
                "Git with a cup of tea! Painless self-hosted all-in-one software development service, including Git hosting, code review, team collaboration, package registry and CI/CD.";
              href = "https://git.${domain}";
              siteMonitor = "https://git.${domain}";
            };
          }
          {
            Gollum = {
              href = "https://wiki.${domain}";
              icon = "https://avatars.githubusercontent.com/u/3840027?v=4";
              description =
                "A simple, Git-powered wiki with a local frontend and support for many kinds of markup and content.";
              siteMonitor = "https://wiki.${domain}";
            };
          }
          {
            Vscode = {
              icon =
                "https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/visual-studio-code-icon.png";
              description =
                "Visual Studio Code combines the simplicity of a source code editor with powerful developer tooling, like IntelliSense code completion and debugging.";
              href = "https://code.${domain}";
              siteMonitor = "https://code.${domain}";
            };
          }
        ];
      }
      {
        Personal = [
          {
            Nextcloud = {
              icon =
                "https://cdn.icon-icons.com/icons2/2699/PNG/512/nextcloud_logo_icon_168948.png";
              description =
                "A safe home for all your data – community-driven, free & open source 👏";
              href = "https://cloud.${domain}";
              siteMonitor = "https://cloud.${domain}";
            };
          }
          {
            Jellyfin = {
              icon =
                "https://dl.flathub.org/media/com/github/iwalton3.jellyfin-media-player/20eebaca475a7aa1b2511bed6a86abeb/icons/128x128@2/com.github.iwalton3.jellyfin-media-player.webp";
              description =
                "Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached. Your media, your server, your way.";
              href = "https://jellyfin.${domain}";
              siteMonitor = "https://jellyfin.${domain}";
            };
          }
          {
            Vaultwarden = {
              icon =
                "https://assets.streamlinehq.com/image/private/w_300,h_300,ar_1/f_auto/v1/icons/logos/vaultwarden-ns52zbeqsxclzh9eke52cj.png/vaultwarden-eawsbmiuegj01cry9sop.png?_a=DAJFJtWIZAAC";
              description =
                "Unofficial Bitwarden compatible server written in Rust, formerly known as bitwarden_rs";
              href = "https://vault.${domain}";
              siteMonitor = "https://vault.${domain}";
            };
          }
        ];
      }
      {
        Public = [
          {
            WriteFreely = {
              icon =
                "https://cloud68.co/assets/media/managed-hosting/photo//writefreely.png";
              description =
                "A clean, Markdown-based publishing platform made for writers. Write together and build a community.";
              href = "https://blog.${domain}";
              siteMonitor = "https://blog.${domain}";
            };
          }
          {
            Docuseal = {
              icon =
                "https://avatars.githubusercontent.com/u/138379721?s=280&v=4";
              description =
                "Open source DocuSign alternative. Create, fill, and sign digital documents ✍️";
              href = "https://docsign.${domain}";
              siteMonitor = "https://docsign.${domain}";
            };
          }
        ];
      }
      {
        Utils = [
          {
            Convertx = {
              icon = "https://cdn-icons-png.flaticon.com/512/8970/8970989.png";
              description =
                "A self-hosted online file converter. Supports over a thousand different formats. Written with TypeScript, Bun and Elysia.";
              href = "https://convert.${domain}";
              siteMonitor = "https://convert.${domain}";
            };
          }
          {
            MeTube = {
              icon =
                "https://artifacthub.io/image/57011362-b4aa-4485-a77b-8b744d50708e@3x";
              description =
                "Self-hosted YouTube downloader (web UI for youtube-dl / yt-dlp)";
              href = "https://yt.${domain}";
              siteMonitor = "https://yt.${domain}";
            };
          }
          {
            Transmission = {
              icon =
                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Transmission_Icon.svg/2048px-Transmission_Icon.svg.png";
              description =
                "Transmission is a fast, easy, and free BitTorrent client";
              href = "https://torrent.${domain}";
              siteMonitor = "https://torrent.${domain}";
            };
          }
        ];
      }

    ];
    # bookmarks = [{
    #   NixOs = [
    #     {
    #       "Packages Search (stable channel)" = [{
    #         icon =
    #           "https://static-00.iconduck.com/assets.00/nixos-icon-2048x1776-8czr8nir.png";
    #         abbr = "NS";
    #         href =
    #           "https://search.nixos.org/packages?channel=24.11&from=0&size=50&sort=relevance&type=packages&query=";
    #       }];
    #     }
    #     {
    #       "Packages Search (unstable channel)" = [{
    #         icon =
    #           "https://static-00.iconduck.com/assets.00/nixos-icon-2048x1776-8czr8nir.png";
    #         abbr = "NS";
    #         href =
    #           "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=";
    #       }];
    #     }
    #     {
    #       "Packages Options (stable channel)" = [{
    #         icon =
    #           "https://static-00.iconduck.com/assets.00/nixos-icon-2048x1776-8czr8nir.png";
    #         abbr = "NS";
    #         href =
    #           "https://search.nixos.org/options?channel=24.11&from=0&size=50&sort=relevance&type=packages&query=";
    #       }];
    #     }
    #     {
    #       "Packages Options (unstable channel)" = [{
    #         icon =
    #           "https://static-00.iconduck.com/assets.00/nixos-icon-2048x1776-8czr8nir.png";
    #         abbr = "NS";
    #         href =
    #           "https://search.nixos.org/options?channel=unstable&size=50&sort=relevance&type=packages&query=";
    #       }];
    #     }
    #     {
    #       "Nixos Wiki" = [{
    #         icon =
    #           "https://static-00.iconduck.com/assets.00/nixos-icon-2048x1776-8czr8nir.png";
    #         abbr = "NS";
    #         href = "https://wiki.nixos.org/wiki/NixOS_Wiki";
    #       }];
    #     }

    #   ];
    # }];

    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/var/lib/storage";
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
          provider = "google";
          target = "_blank";
          showSearchSuggestions = true;
          focus = false;
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

