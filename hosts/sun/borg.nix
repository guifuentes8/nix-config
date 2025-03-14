{ ... }:
let
  mainPath = "/var/lib/storage/nextcloud/data/guifuentes8/files";
  backupPath = "/var/lib/storage_backup";
in {
  services.borgbackup.jobs.borg-nextcloud = {
    paths = [ "${mainPath}/Media" "${mainPath}/Documents" "${mainPath}/Notes" ];
    encryption.mode = "none";
    environment.BORG_RSH = "ssh -i /home/guifuentes8/.ssh/id_ed25519";
    repo = "${backupPath}/backup_files/nextcloud/";
    compression = "auto,zstd";
    startAt = "daily";
  };

}
