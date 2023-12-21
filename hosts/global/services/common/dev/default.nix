{ pkgs, ... }: {
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    docker-compose

  ];

 services.postgresql = {
    enable = false;
      package = pkgs.postgresql_15;

    ensureDatabases = [ "mydatabase" ];
      enableTCPIP = true;

    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
    };
}
