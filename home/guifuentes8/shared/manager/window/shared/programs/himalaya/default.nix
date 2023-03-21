{ pkgs, ... }:
let
  script = ./script.sh;
in
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
          imap-passwd-cmd = "cat /home/guifuentes8/dotfiles/.secrets/guifuentes8.txt";
          smtp-passwd-cmd = "cat /home/guifuentes8/dotfiles/.secrets/guifuentes8.txt";
          signature = "Atenciosamente,\nGuilherme Fuentes";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = script;
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 50;

        };
      };

      folders = {
        inbox = "INBOX";
        sent = "[Gmail]/Sent Mail";
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
          imap-passwd-cmd = "cat /home/guifuentes8/dotfiles/.secrets/gcf.txt";
          smtp-passwd-cmd = "cat /home/guifuentes8/dotfiles/.secrets/gcf.txt";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = script;
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 50;

        };
      };

      folders = {
        inbox = "INBOX";
        sent = "[Gmail]/Sent Mail";
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
          imap-passwd-cmd = "cat /home/guifuentes8/dotfiles/.secrets/hubs.txt";
          smtp-passwd-cmd = "cat /home/guifuentes8/dotfiles/.secrets/hubs.txt";
          downloads-dir = "~/Downloads";
          imap-notify-cmd = script;
          imap-notify-query = "UNSEEN";
          email-listing-page-size = 25;

        };
      };

      folders = {
        inbox = "INBOX";
        sent = "[Gmail]/Sent Mail";
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
  };
}
