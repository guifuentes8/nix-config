{...}:{
    services.writefreely = {
        enable = true;
        host = "writefreely";
        admin = {
          name = "guifuentes8";
          };
        settings = {
          app = {
            single_user = true;
            };
          server = {
            port = 8088;
            };
          };
      };
  }
