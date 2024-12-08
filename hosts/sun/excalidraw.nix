{...}:
{
  virtualisation.oci-containers.backend = "docker";
 virtualisation.oci-containers.containers.excalidraw = {                                                                                                                                                                                                                                      
   hostname = "excalidraw";
    image = "excalidraw/excalidraw";                                                                                                                                               
    ports = [ "127.0.0.1:8089:80" ];                                                                                                                                                                                                                                                        
  };
 
 virtualisation.oci-containers.containers.whoogle = {                                                                                                                                                                                                                                      
   hostname = "whoogle";
    image = "benbusby/whoogle-search";                                                                                                                                               
    ports = [ "127.0.0.1:9099:5000" ];                                                                                                                                                                                                                                                        
  };
  virtualisation.oci-containers.containers.cloudbeaver = {                                                                                                                                                                                                                                      
   hostname = "cloudbeaver";
    image = "dbeaver/cloudbeaver";                                                                                                                                               
    ports = [ "127.0.0.1:9096:8978" ];                                                                                                                                                                                                                                                        
  };
  virtualisation.oci-containers.containers.convertx = {                                                                                                                                                                                                                                      
   hostname = "convertx";
    image = "c4illin/convertx
";                                                                                                                                               
    ports = [ "127.0.0.1:9097:3000" ];                                                                                                                                                                                                                                                        
  };
  virtualisation.oci-containers.containers.metube = {                                                                                                                                                                                                                                      
   hostname = "metube";
    image = "alexta69/metube";                                                                                                                                               
    ports = [ "127.0.0.1:9098:8081" ];                                                                                                                                                                                                                                                        
    volumes = [
    "/home/guifuentes8/Videos:/downloads"
];
  };

}
