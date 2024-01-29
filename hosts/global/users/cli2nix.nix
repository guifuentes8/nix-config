{ pkgs, config, ... }:

{
  programs.zsh.enable = true;
  users.users.cli2nix = {
    isNormalUser = true;
    description = "Guilherme Fuentes";
    extraGroups =
      [ "networkmanager" "wheel" "sudo" "video" "docker" "adbusers" "input" ];
    shell = pkgs.zsh;
  };

}
