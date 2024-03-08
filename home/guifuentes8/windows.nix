{ pkgs, lib, config, nix-colors, ... }: {
  imports =
    [ ./global ./features/cli ./features/desktop/common ./features/dev ];

  home = {
    username = lib.mkDefault "guifuentes8";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.11";
    sessionVariables = {
      WARP_THEMES_DIR =
        "${config.home.homeDirectory}/.local/share/warp-terminal/themes";
      PASSWORD_STORE_DIR =
        lib.mkForce "${config.home.homeDirectory}/nix-config/password-store";
    };
    # persistence = {
    #   "/persist/home/guifuentes8" = {
    #     directories = [
    #       "Documents"
    #       "Downloads"
    #       "Pictures"
    #       "Videos"
    #       ".local/bin"
    #       ".local/share/nix" # trusted settings and repl history
    #     ];
    #     allowOther = true;
    #   };
    # };
  };

  # As already mentioned
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
  # The critical missing piece for me
  xdg.systemDirs.data =
    [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];

}
