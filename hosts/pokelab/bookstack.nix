{ ... }: {
  services.bookstack = {
    enable = true;
    appKeyFile = "/var/lib/bookstack/bookstack-appkey";
    hostname = "bookstack";
    appURL = "http://pokelab:4000";
    database = {
      createLocally = true;
      user = "bookstack";
      name = "bookstack";
    };
  };
}
