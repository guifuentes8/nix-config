{ pkgs, ... }: {
  services.borgbackup.jobs.borg-nextcloud = {
    paths = "/var/lib/nextcloud/data/guifuentes8/files";
    encryption.mode = "none";
    environment.BORG_RSH = "ssh -i /home/guifuentes8/.ssh/id_ed25519";
    repo = "/home/guifuentes8/Backup";
    compression = "auto,zstd";
    startAt = "daily";
  };

}
