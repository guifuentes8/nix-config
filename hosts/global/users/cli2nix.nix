{ pkgs, config, ... }:

{
  programs.zsh.enable = true;
  users.users.cli2nix = {
    isNormalUser = true;
    description = "Cli2nix";
    extraGroups =
      [ "networkmanager" "wheel" "sudo" "video" "docker" "adbusers" "input" ];
    shell = pkgs.zsh;
  };

}
