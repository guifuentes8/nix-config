{ ... }: {

  services.dokuwiki.sites."dokuwiki" = {
    enable = true;
    settings = {
      baseurl = "https://wiki.guifuentes8.com.br";
      title = "Guifuentes8 Wiki";
      acluse = false;
      useacl = false;
    };
  };
}
