{...}:{
  services.rustdesk-server = {
      enable = false;
      openFirewall = true;
      relay ={
          enable = true;

        };
    };
  }
