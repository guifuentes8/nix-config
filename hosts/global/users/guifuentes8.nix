{ pkgs, config, ... }:

{
  programs.zsh.enable = true;
  users.users.guifuentes8 = {
    isNormalUser = true;
    description = "Guilherme Fuentes";
    extraGroups = [ "networkmanager" "wheel" "sudo" "video" "docker" "adbusers" "input" ];
    shell = pkgs.zsh;
  };
}
