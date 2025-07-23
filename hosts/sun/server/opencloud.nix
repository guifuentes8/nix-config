{ ... }: {
  services.opencloud = {
    enable = true;
    url = "http://localhost:9010";
    port = 9010;
    address = "localhost";
    environment = {
      OC_INSECURE = "false";
      PROXY_TLS = "false";
      INITIAL_ADMIN_PASSWORD = "admin";
      IDM_CREATE_DEMO_USERS = "true";
      ADMIN_PASSWORD = "admin";
    };
  };
}
