{ ... }: {
  services.writefreely = {
    enable = true;
    host = "blog.guifuentes8.com.br";
    user = "writefreely";
    admin = { name = "guifuentes8"; };
    nginx = {
      enable = true;
      forceSSL = true;
    };
    acme.enable = true;
    settings = {
      app = {
        single_user = true;
        editor = "classic";
        site_name = "Guifuentes8 Blog";
        site_description =
          "My first blog to share some experiences and articles to help my techs friends!";
        min_username_len = 8;
        monetization = false;
        wf_modesty = true;
        open_registration = false;
        default_visibility = "public";
      };
      server = { port = 9090; };
    };
  };
}
