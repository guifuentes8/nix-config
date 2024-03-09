{ pkgs, lib, config, nix-colors, ... }:
let waylandArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
in {
  imports =
    [ ./global ./features/cli ./features/desktop/common ./features/dev ];

  nixpkgs.config = {
    spotify.commandLineArgs = waylandArgs;
    chromium.commandLineArgs = waylandArgs;
    slack.commandLineArgs = waylandArgs;
    bitwarden.commandLineArgs = waylandArgs;
    discord.commandLineArgs = waylandArgs;
    ytmdesktop.commandLineArgs = waylandArgs;
    onlyoffice-bin.commandLineArgs = waylandArgs;
  };

  targets.genericLinux.enable = true;
  xdg.enable = true;
  xdg.mime.enable = true;

}
