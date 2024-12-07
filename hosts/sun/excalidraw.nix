{...}:
{
  virtualisation.oci-containers.backend = "docker";
 virtualisation.oci-containers.containers.excalidraw = {                                                                                                                                                                                                                                      
   hostname = "excalidraw";
    image = "excalidraw/excalidraw";                                                                                                                                               
    ports = [ "127.0.0.1:8089:80" ];                                                                                                                                                                                                                                                        
  };
 
}
