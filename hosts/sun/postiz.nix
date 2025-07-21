# Auto-generated using compose2nix v0.3.1.
{ pkgs, lib, ... }:

{
  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."postiz" = {
    image = "ghcr.io/gitroomhq/postiz-app:latest";
    environment = {
      "BACKEND_INTERNAL_URL" = "http://localhost:3000";
      "DATABASE_URL" =
        "postgresql://postiz-user:postiz-password@postiz-postgres:5432/postiz-db-local";
      "DISABLE_REGISTRATION" = "true";
      "FRONTEND_URL" = "https://postiz.guifuentes8.com.br";
      "IS_GENERAL" = "true";
      "JWT_SECRET" = "Agorajaera@123";
      "LINKEDIN_CLIENT_ID" = "77yxrh9il6rlos";
      "LINKEDIN_CLIENT_SECRET" = "WPL_AP1.pwWZtYCYH3VEgOt0.XbJiGQ==";
      "MAIN_URL" = "https://postiz.guifuentes8.com.br";
      "NEXT_PUBLIC_BACKEND_URL" = "https://postiz.guifuentes8.com.br/api";
      "NEXT_PUBLIC_UPLOAD_DIRECTORY" = "/uploads";
      "NTBA_FIX_350" = "1";
      "REDIS_URL" = "redis://postiz-redis:6379";
      "STORAGE_PROVIDER" = "local";
      "TELEGRAM_BOT_NAME" = "G8_center_bot";
      "TELEGRAM_TOKEN" = "8055435336:AAEasiAieq2edrSHSvTIeC_Wkb4spP3xe2M";
      "UPLOAD_DIRECTORY" = "/uploads";
      "X_API_KEY" = "4VdFmpwcCMOAPUJIguJHKnsfQ";
      "X_API_SECRET" = "k8QbsIydGVDHWWNObJCkOx7f4nJX73lpXbjZRX1QSmFVywicik";
      "X_CLIENT" = "V2UtYlIxcXNVb0lKdGYwVmM5emw6MTpjaQ";
      "X_SECRET" = "ZEGO1vofr28AXcTIy4ymMf4ThkQrUppgHAoWqKwWZTTyDtskvi";
      "YOUTUBE_CLIENT_ID" =
        "1097134545979-p3tt5hgdhv2l5208lbq98mf643sv910h.apps.googleusercontent.com";
      "YOUTUBE_CLIENT_SECRET" = "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";
      "TIKTOK_CLIENT_ID" = "awh7rytfjqjdkmtq";
      "TIKTOK_CLIENT_SECRET" = "ZbyHpxO7Vq04MLdRzllEQT6zMw15fYX9";
      "INSTAGRAM_APP_ID" = "689901326994321";
      "INSTAGRAM_APP_SECRET" = "76de033f12fc5a0cd5c0ade5cab7ee09";
    };
    volumes =
      [ "postiz_postiz-config:/config:rw" "postiz_postiz-uploads:/uploads:rw" ];
    ports = [ "5000:5000/tcp" ];
    dependsOn = [ "postiz-postgres" "postiz-redis" ];
    log-driver = "journald";
    extraOptions =
      [ "--network-alias=postiz" "--network=postiz_postiz-network" ];
  };
  systemd.services."podman-postiz" = {
    serviceConfig = { Restart = lib.mkOverride 90 "always"; };
    after = [
      "podman-network-postiz_postiz-network.service"
      "podman-volume-postiz_postiz-config.service"
      "podman-volume-postiz_postiz-uploads.service"
    ];
    requires = [
      "podman-network-postiz_postiz-network.service"
      "podman-volume-postiz_postiz-config.service"
      "podman-volume-postiz_postiz-uploads.service"
    ];
    partOf = [ "podman-compose-postiz-root.target" ];
    wantedBy = [ "podman-compose-postiz-root.target" ];
  };
  virtualisation.oci-containers.containers."postiz-postgres" = {
    image = "postgres:17-alpine";
    environment = {
      "POSTGRES_DB" = "postiz-db-local";
      "POSTGRES_PASSWORD" = "postiz-password";
      "POSTGRES_USER" = "postiz-user";
    };
    volumes = [ "postiz_postgres-volume:/var/lib/postgresql/data:rw" ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=pg_isready -U postiz-user -d postiz-db-local"
      "--health-interval=10s"
      "--health-retries=3"
      "--health-timeout=3s"
      "--network-alias=postiz-postgres"
      "--network=postiz_postiz-network"
    ];
  };
  systemd.services."podman-postiz-postgres" = {
    serviceConfig = { Restart = lib.mkOverride 90 "always"; };
    after = [
      "podman-network-postiz_postiz-network.service"
      "podman-volume-postiz_postgres-volume.service"
    ];
    requires = [
      "podman-network-postiz_postiz-network.service"
      "podman-volume-postiz_postgres-volume.service"
    ];
    partOf = [ "podman-compose-postiz-root.target" ];
    wantedBy = [ "podman-compose-postiz-root.target" ];
  };
  virtualisation.oci-containers.containers."postiz-redis" = {
    image = "redis:7.2";
    volumes = [ "postiz_postiz-redis-data:/data:rw" ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=redis-cli ping"
      "--health-interval=10s"
      "--health-retries=3"
      "--health-timeout=3s"
      "--network-alias=postiz-redis"
      "--network=postiz_postiz-network"
    ];
  };
  systemd.services."podman-postiz-redis" = {
    serviceConfig = { Restart = lib.mkOverride 90 "always"; };
    after = [
      "podman-network-postiz_postiz-network.service"
      "podman-volume-postiz_postiz-redis-data.service"
    ];
    requires = [
      "podman-network-postiz_postiz-network.service"
      "podman-volume-postiz_postiz-redis-data.service"
    ];
    partOf = [ "podman-compose-postiz-root.target" ];
    wantedBy = [ "podman-compose-postiz-root.target" ];
  };

  # Networks
  systemd.services."podman-network-postiz_postiz-network" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f postiz_postiz-network";
    };
    script = ''
      podman network inspect postiz_postiz-network || podman network create postiz_postiz-network
    '';
    partOf = [ "podman-compose-postiz-root.target" ];
    wantedBy = [ "podman-compose-postiz-root.target" ];
  };

  # Volumes
  systemd.services."podman-volume-postiz_postgres-volume" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect postiz_postgres-volume || podman volume create postiz_postgres-volume
    '';
    partOf = [ "podman-compose-postiz-root.target" ];
    wantedBy = [ "podman-compose-postiz-root.target" ];
  };
  systemd.services."podman-volume-postiz_postiz-config" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect postiz_postiz-config || podman volume create postiz_postiz-config
    '';
    partOf = [ "podman-compose-postiz-root.target" ];
    wantedBy = [ "podman-compose-postiz-root.target" ];
  };
  systemd.services."podman-volume-postiz_postiz-redis-data" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect postiz_postiz-redis-data || podman volume create postiz_postiz-redis-data
    '';
    partOf = [ "podman-compose-postiz-root.target" ];
    wantedBy = [ "podman-compose-postiz-root.target" ];
  };
  systemd.services."podman-volume-postiz_postiz-uploads" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect postiz_postiz-uploads || podman volume create postiz_postiz-uploads
    '';
    partOf = [ "podman-compose-postiz-root.target" ];
    wantedBy = [ "podman-compose-postiz-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-postiz-root" = {
    unitConfig = { Description = "Root target generated by compose2nix."; };
    wantedBy = [ "multi-user.target" ];
  };
}
