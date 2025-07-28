{ ... }: {
  imports = [ ./postiz.nix ];

  # virtualisation.oci-containers.backend = "docker";
  virtualisation.oci-containers.containers.excalidraw = {
    hostname = "excalidraw";
    image = "excalidraw/excalidraw";
    ports = [ "127.0.0.1:9003:80" ];
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
    #volumes = [ "/var/lib/storage/nextcloud/data/g8/files/Youtube:/downloads" ];
  };

  virtualisation.oci-containers.containers.docuseal = {
    hostname = "docuseal";
    image = "docuseal/docuseal";
    ports = [ "127.0.0.1:9091:3000" ];
  };
}
