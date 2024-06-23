{ pkgs, ... }: {
  services.borgbackup.jobs.borg-nextcloud = {
    paths = "/run/media/guifuentes8/pokestorage/nextcloud/";
    encryption.mode = "none";
    environment.BORG_RSH = "ssh -i /home/guifuentes8/.ssh/id_ed25519";
    repo = "/run/media/guifuentes8/backup_files/nextcloud/";
    compression = "auto,zstd";
    startAt = "daily";
  };

}
