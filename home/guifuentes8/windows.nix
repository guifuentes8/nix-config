{ pkgs, outputs, unstable, lib, config, nix-colors, windowsUser, ... }:
let waylandArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

in {
  imports = [ ./global ./features/cli ./features/dev ];

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
      GH_TOKEN = "$(${pkgs.pass}/bin/pass show github/token)";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      WGPU_BACKEND = "gl";
      BROWSER = "firefox";
      WARP_THEMES_DIR =
        "${config.home.homeDirectory}/.local/share/warp-terminal/themes";

    };
  };

  programs.zsh.shellAliases = {
    adb =
      "/mnt/c/Users/${windowsUser}/Local\\ Settings/Android/Sdk/platform-tools/adb";

  };

  programs.zsh.localVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WGPU_BACKEND = "gl";
    BROWSER = "firefox";
    WARP_THEMES_DIR =
      "${config.home.homeDirectory}/.local/share/warp-terminal/themes";
    GH_TOKEN = "$(${pkgs.pass}/bin/pass show github/token)";
  };
}
