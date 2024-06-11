{ pkgs, config, ... }:

{
  imports = [

    # Global config (required)
    ./global
    ./features/dev
    ./features/desktop/common
    ./features/desktop/gnome.nix

  ];

  # As already mentioned
  targets.genericLinux.enable = true;
  programs.zsh.initExtraFirst = "cat ${./extras/magikarp.txt}";

  # The critical missing piece for me
  xdg.systemDirs.data =
    [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];

}
