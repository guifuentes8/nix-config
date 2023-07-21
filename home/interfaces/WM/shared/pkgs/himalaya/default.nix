{ pkgs, config, ... }:
{

  programs.himalaya = {
    enable = true;
    package = pkgs.himalaya;
  };


  accounts.email.accounts = {
    guifuentes8 = {
      primary = true;
      realName = "Guilherme Fuentes";
      userName = "guifuentes8";
      address = "guifuentes8@gmail.com";
      passwordCommand = "${pkgs.pass}/bin/pass show himalaya/gf8";
      imap = {
        host = "imap.gmail.com";
        port = 993;
      };
      smtp = {
        host = "smtp.gmail.com";
        port = 465;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };
      himalaya = {
        enable = true;
        settings = {
          default = true;
          sync = true;
          backend = "imap";
          imap-watch-cmds = [ "${pkgs.himalaya}/bin/himalaya --account guifuentes8 account sync -f INBOX" ];
          signature = "Atenciosamente,\nGuilherme Fuentes";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = ''${pkgs.libnotify}/bin/notify-send "󰊫 <sender>" "<subject>" '';
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 50;
        };
      };

      folders = {
        inbox = "INBOX";
        sent = "[Gmail]/Sent";
        drafts = "[Gmail]/Drafts";
        trash = "[Gmail]/Trash";
      };

    };

    gcf = {
      realName = "Guilherme Fuentes";
      userName = "guilherme.c.fuentes";
      address = "guilherme.c.fuentes@gmail.com";
      passwordCommand = "${pkgs.pass}/bin/pass show himalaya/gcf";
      imap = {
        host = "imap.gmail.com";
        port = 993;
      };
      smtp = {
        host = "smtp.gmail.com";
        port = 465;
        tls = {
          enable = true;
          useStartTls = true;
        };
      };
      himalaya = {
        enable = true;
        settings = {
          sync = true;
          backend = "imap";
          sender = "smtp";
          imap-watch-cmds = [ "${pkgs.himalaya}/bin/himalaya --account gcf account sync -f INBOX" ];
          downloads-dir = "~/Downloads";
          imap-notify-cmd = ''${pkgs.libnotify}/bin/notify-send "󰊫 <sender>" "<subject>" '';
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 50;

        };
      };

      folders = {
        inbox = "INBOX";
        sent = "[Gmail]/Sent";
        drafts = "[Gmail]/Drafts";
        trash = "[Gmail]/Trash";
      };

    };

  };

  services.himalaya-watch = {
    enable = true;
    environment = {
      PASSWORD_STORE_DIR = "${config.home.sessionVariables.PASSWORD_STORE_DIR}";
      RUST_LOG = "debug";
    };
    settings.keepalive = 10;
  };

  services.himalaya-notify = {
    enable = true;
    environment = {
      PASSWORD_STORE_DIR = "${config.home.sessionVariables.PASSWORD_STORE_DIR}";
      RUST_LOG = "debug";
    };
    settings.keepalive = 10;
  };


  systemd.user.services = {
    himalaya-watch-gcf = {
      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        Environment = [ "PASSWORD_STORE_DIR=/home/guifuentes8/nix-config/.password-store" ];
        ExecSearchPath = /bin;
        ExecStart = "${pkgs.himalaya}/bin/himalaya -a gcf watch";
        Restart = "always";
        RestartSec = 10;
      };

      Unit = {
        After = [ "network.target" ];
        Description = "Himalaya folder changes watcher service";
      };
    };
  };

  systemd.user.services = {
    himalaya-notify-gcf = {
      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        Environment = [ "PASSWORD_STORE_DIR=/home/guifuentes8/nix-config/.password-store" ];
        ExecSearchPath = /bin;
        ExecStart = "${pkgs.himalaya}/bin/himalaya -a gcf notify";
        Restart = "always";
        RestartSec = 10;
      };

      Unit = {
        After = [ "network.target" ];
        Description = "Himalaya folder changes watcher service";
      };
    };
  };
}



