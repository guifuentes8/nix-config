{ pkgs, ... }: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    ensureDatabases = [ "nextcloud" "postgres" ];
    enableTCPIP = true;
    ensureUsers = [{ name = "nextcloud"; }];
    settings = {
      shared_buffers = "24GB";
      work_mem = "256MB";
      maintenance_work_mem = "2GB";
      effective_cache_size = "32GB";
      max_connections = "500";
      checkpoint_timeout = "15min";
      checkpoint_completion_target = "0.9";
      max_parallel_workers_per_gather = 8;
      wal_buffers = "16MB";
      autovacuum = "on";
      autovacuum_analyze_scale_factor =
        "0.1"; # Trigger vacuum more often to keep database healthy
      autovacuum_vacuum_scale_factor = "0.2";
    };
    authentication = pkgs.lib.mkOverride 10 ''
      local all      all    trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
  };
  systemd.services."nextcloud-setup" = {
    requires = [ "postgresql.service" ];
    after = [ "postgresql.service" ];
  };

}
