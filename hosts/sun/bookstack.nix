{ ... }: {
  services.bookstack = {
    enable = true;
    appKeyFile = "/etc/bookstack-appkey";
    hostname = "bookstack";
    appURL = "bookstack.guifuentes8.com.br";

    database = {
      createLocally = true;
      user = "bookstack";
      name = "bookstack";
    };
  };
  environment.etc."bookstack-appkey".text =
    "1DVAk8U1fz4nUTmbF0cuj1aru4EZyUL2DrMnyN5ib0c=";

}
