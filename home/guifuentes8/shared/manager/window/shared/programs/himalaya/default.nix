{ pkgs, inputs, ... }:
{

  accounts.email.accounts = {
    guifuentes8 = {
      primary = true;
      realName = "Guilherme Fuentes";
      userName = "guifuentes8";
      address = "guifuentes8@gmail.com";
      himalaya = {
        backend = "imap";
        sender = "smtp";
        enable = true;
        settings = {
          default = true;
          sync = true;
          watch-cmds = [ "himalaya --account guifuentes8 account sync" ];
          imap-passwd-cmd = "sed -n 2p /home/guifuentes8/nix-config/.secrets/mail.txt";
          smtp-passwd-cmd = "sed -n 2p /home/guifuentes8/nix-config/.secrets/mail.txt";
          signature = "Atenciosamente,\nGuilherme Fuentes";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = "notify-send '󰊫 <sender>' '<subject>'";
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 40;
        };
      };

      folders = {
        inbox = "INBOX";
        sent = ".Sent";
        drafts = "[Gmail]/Drafts";
        trash = "[Gmail]/Trash";
      };

      imap.host = "imap.gmail.com";
      imap.port = 993;
      smtp.host = "smtp.gmail.com";
      smtp.port = 465;

    };

    gcf = {
      realName = "Guilherme Fuentes";
      userName = "guilherme.c.fuentes";
      address = "guilherme.c.fuentes@gmail.com";
      himalaya = {
        backend = "imap";
        sender = "smtp";
        enable = true;
        settings = {
          sync = true;
          watch-cmds = [ "himalaya --account gcf account sync" ];
          imap-passwd-cmd = "sed -n 4p /home/guifuentes8/nix-config/.secrets/mail.txt";
          smtp-passwd-cmd = "sed -n 4p /home/guifuentes8/nix-config/.secrets/mail.txt";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = "notify-send '󰊫 <sender>' '<subject>'";
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 40;

        };
      };

      folders = {
        inbox = "INBOX";
        sent = ".Sent";
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
        backend = "imap";
        sender = "smtp";
        enable = true;
        settings = {
          sync = true;
          watch-cmds = [ "himalaya --account hubs account sync" ];
          imap-passwd-cmd = "sed -n 6p /home/guifuentes8/nix-config/.secrets/mail.txt";
          smtp-passwd-cmd = "sed -n 6p /home/guifuentes8/nix-config/.secrets/mail.txt";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = "notify-send '󰊫 <sender>' '<subject>'";
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 40;

        };
      };

      folders = {
        inbox = "INBOX";
        sent = ".Sent";
        drafts = "[Gmail]/Drafts";
        trash = "[Gmail]/Trash";
      };

      imap.host = "imap.gmail.com";
      imap.port = 993;
      smtp.host = "smtp.gmail.com";
      smtp.port = 465;
    };

  };

  programs.himalaya = {
    enable = true;
    package = inputs.himalaya.packages.${pkgs.system}.default;
  };

}
