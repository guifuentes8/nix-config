{ ... }: {
  virtualisation.oci-containers.backend = "docker";
  virtualisation.oci-containers.containers.excalidraw = {
    hostname = "excalidraw";
    image = "excalidraw/excalidraw";
    ports = [ "127.0.0.1:9003:80" ];
    environment = {
      NEXTCLOUD_URL = "https://cloud.guifuentes8.com.br";
      JWT_SECRET_KEY = "Guigui@@@2035";
    };

  };

  virtualisation.oci-containers.containers.cloudbeaver = {
    hostname = "cloudbeaver";
    image = "dbeaver/cloudbeaver";
    ports = [ "127.0.0.1:9002:8978" ];
  };
  virtualisation.oci-containers.containers.convertx = {
    hostname = "convertx";
    image = "c4illin/convertx";
    ports = [ "127.0.0.1:9021:3000" ];
  };
  virtualisation.oci-containers.containers.metube = {
    hostname = "metube";
    image = "alexta69/metube";
    ports = [ "127.0.0.1:9022:8081" ];
    volumes = [ "/home/guifuentes8/Videos:/downloads" ];
  };

  virtualisation.oci-containers.containers.docuseal = {
    hostname = "docuseal";
    image = "docuseal/docuseal";
    ports = [ "127.0.0.1:9091:3000" ];
  };
  # virtualisation.oci-containers.containers.nextcloud-whiteboard-server = {
  #   image = "ghcr.io/nextcloud-releases/whiteboard:release";
  #   hostname = "whiteboard";
  #   ports = [ "127.0.0.1:9050:3002" ];
  #   environment = {
  #     NEXTCLOUD_URL = "https://cloud.guifuentes8.com.br";
  #     JWT_SECRET_KEY = "Guigui@@@2035";
  #   };
  # };
}
