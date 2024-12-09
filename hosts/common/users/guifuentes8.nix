{ pkgs, ... }: {
  programs.zsh.enable = true;
  users.users.guifuentes8 = {
    isNormalUser = true;
    description = "guifuentes8";
    extraGroups = [
      "networkmanager"
      "wheel"
      "sudo"
      "video"
      "docker"
      "adbusers"
      "input"
      "vboxusers"
      "nextcloud"
      "vaultwarden"
      "storage"
      "libvirtd"
      "cloudflared"
      "media"
      "vaultwarden"
      "writefreely"
    ];
    shell = pkgs.zsh;
  };

}
