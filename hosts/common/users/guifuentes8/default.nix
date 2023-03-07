{
  users.users.guifuentes8 = {
    isNormalUser = true;
    description = "Guilherme Fuentes";
    extraGroups = [ "networkmanager" "wheel" "video" "docker" "adbusers" "input" ];
    shell = pkgs.zsh;
  };

}
