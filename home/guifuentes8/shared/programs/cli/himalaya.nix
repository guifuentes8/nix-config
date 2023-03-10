{
  programs.himalaya =
    {
      enable = true;
      settings = {

        display-name = "Guilherme Fuentes";
        downloads-dir = "~/Downloads";
        signature = "Atenciosamente,\nGuilherme Fuentes";
        email-listing-page-size = 50;

        gmail = {

          default = true;
          email = "guifuentes8@gmail.com";

          backend = "imap";
          imap-host = "imap.gmail.com";
          imap-port = 993;
          imap-login = "guifuentes8@gmail.com";
          imap-passwd-cmd = "cat ~/dotfiles/.secrets/himalaya-gmail.txt";

          sender = "smtp";
          smtp-host = "smtp.gmail.com";
          smtp-port = 465;
          smtp-login = "guifuentes8@gmail.com";
          smtp-passwd-cmd = "cat ~/dotfiles/.secrets/himalaya-gmail.txt";
        };

        gmail.folder-aliases = {
          inbox = "INBOX";
          sent = "[Gmail]/Sent Mail";
          drafts = "[Gmail]/Drafts";
          trash = "[Gmail]/Trash";
        };
      };
    };
}
