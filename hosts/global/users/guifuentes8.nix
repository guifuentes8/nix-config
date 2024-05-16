{ pkgs, config, ... }:

{
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
      "storage"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

}
