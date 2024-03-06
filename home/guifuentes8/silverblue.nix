{ pkgs, config, ... }:

{
  imports = [

    # Global config (required)
    ./global
    #    ./features/cli
    ./features/dev
    ./features/desktop/common
    ./features/desktop/gnome.nix
    #    ./features/productivity
    # ./features/video/davinci-resolve

  ];

  # As already mentioned
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  # The critical missing piece for me
  xdg.systemDirs.data =
    [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];

}
