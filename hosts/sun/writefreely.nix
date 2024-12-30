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
        single_user = false;
        editor = "pad";
        site_name = "guifuentes8";
        site_description =
          "My first blog to share some experiences and articles to help my techs friends!";
        min_username_len = 8;
        monetization = false;
        wf_modesty = false;
        open_registration = false;
        open_deletion = true;
        default_visibility = "public";
        max_blogs = 10;
      };
      server = { port = 9090; };
    };
  };
}
