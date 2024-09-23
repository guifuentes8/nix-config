{ ... }:
let mainPath = "/var/lib/nextcloud/data/guifuentes8/files";
in {
  services.borgbackup.jobs.borg-nextcloud = {
    paths = [ "${mainPath}/Media" "${mainPath}/Documents" "${mainPath}/Notes" ];
    encryption.mode = "none";
    environment.BORG_RSH = "ssh -i /home/guifuentes8/.ssh/id_ed25519";
    repo = "/run/media/guifuentes8/backup_files/";
    compression = "auto,zstd";
    startAt = "daily";
  };

}
