{ config, ... }: {
  services = {
    playerctld.enable = true;
    mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Nextcloud/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire"
        }
      '';
    };
    caffeine.enable = true;
    kdeconnect = {
      enable = false;
      indicator = true;
    };
    nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}
