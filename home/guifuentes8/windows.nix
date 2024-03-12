{ pkgs, outputs, unstable, lib, config, nix-colors, ... }:
let waylandArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

in {
  imports =
    [ ./global ./features/cli ./features/dev/languages ./features/dev/neovim ];

  nixpkgs.config = { chromium.commandLineArgs = waylandArgs; };
  targets.genericLinux.enable = true;
  xdg.enable = true;
  xdg.mime.enable = true;
  home.file = {
    ".vscode-server/server-env-setup" = {
      enable = true;
      source = ./server-env-setup;
    };
  };

  home = {
    packages = [ unstable.warp-terminal pkgs.firefox ];
    sessionVariables = {
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      WGPU_BACKEND = "gl";
      BROWSER = "firefox";
      WARP_THEMES_DIR =
        "${config.home.homeDirectory}/.local/share/warp-terminal/themes";

    };
  };

  programs.zsh.localVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WGPU_BACKEND = "gl";
    BROWSER = "firefox";
    WARP_THEMES_DIR =
      "${config.home.homeDirectory}/.local/share/warp-terminal/themes";

  };
}
