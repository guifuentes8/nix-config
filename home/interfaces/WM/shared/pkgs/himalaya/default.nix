{ pkgs, ... }:
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
      passwordCommand = "pass show himalaya/gf8";
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
          watch-cmds = [ "himalaya --account guifuentes8 account sync" ];
          #imap-passwd-cmd = "pass show himalaya/gf8";
          #smtp-passwd-cmd = "pass show himalaya/gf8";
          signature = "Atenciosamente,\nGuilherme Fuentes";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = "notify-send '󰊫 <sender>' '<subject>'";
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 40;
        };
      };

      folders = {
        inbox = "INBOX";
        sent = "[Gmail]/Sent";
        drafts = "[Gmail]/Drafts";
        trash = "[Gmail]/Trash";
      };

    };

    /* gcf = {
      realName = "Guilherme Fuentes";
      userName = "guilherme.c.fuentes";
      address = "guilherme.c.fuentes@gmail.com";
      himalaya = {
        enable = true;
        settings = {
          sync = true;
          backend = "imap";
          sender = "smtp";
          watch-cmds = [ "himalaya --account gcf account sync" ];
          imap-passwd-cmd = "pass show himalaya/gcf";
          smtp-passwd-cmd = "pass show himalaya/gcf";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = "notify-send '󰊫 <sender>' '<subject>'";
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 40;

        };
      };

      folders = {
        inbox = "INBOX";
        sent = "[Gmail]/Sent";
        drafts = "[Gmail]/Drafts";
        trash = "[Gmail]/Trash";
      };

      imap.host = "imap.gmail.com";
      imap.port = 993;
      smtp.host = "smtp.gmail.com";
      smtp.port = 465;
      };

      hubs = {
      realName = "Guilherme Fuentes";
      userName = "guilherme.fuentes@hubscontabilidade.com.br";
      address = "guilherme.fuentes@hubscontabilidade.com.br";
      himalaya = {
        enable = true;
        settings = {
          sync = true;
          backend = "imap";
          sender = "smtp";
          watch-cmds = [ "himalaya --account hubs account sync" ];
          imap-passwd-cmd = "pass show himalaya/hubs";
          smtp-passwd-cmd = "pass show himalaya/hubs";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = "notify-send '󰊫 <sender>' '<subject>'";
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 40;

        };
      };

      folders = {
        inbox = "INBOX";
        sent = "[Gmail]/Sent";
        drafts = "[Gmail]/Drafts";
        trash = "[Gmail]/Trash";
      };

      imap.host = "imap.gmail.com";
      imap.port = 993;
      smtp.host = "smtp.gmail.com";
      smtp.port = 465;
    }; */

  };


}
