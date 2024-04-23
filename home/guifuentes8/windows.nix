{ pkgs, outputs, unstable, lib, config, nix-colors, configOptions, ... }:
let waylandArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

in {
  imports = [ ./global ./features/cli ./features/dev ./features/productivity ];

  nixpkgs.config = { chromium.commandLineArgs = waylandArgs; };
  targets.genericLinux.enable = true;
  home.file = {
    ".vscode-server/server-env-setup" = {
      enable = true;
      source = ./server-env-setup;
    };
  };

  home = {
    packages = [ ];
    #  sessionVariables = {
    #    GH_TOKEN = "$(${pkgs.pass}/bin/pass show github/token)";
    #  };
  };

  programs.zsh.shellAliases = {
    adb =
      "/mnt/c/Users/${configOptions.windowsUser}/Local\\ Settings/Android/Sdk/platform-tools/adb";

  };

  programs.zsh.localVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WGPU_BACKEND = "gl";
    BROWSER = "org.qutebrowser.qutebrowser.desktop";
    WARP_THEMES_DIR =
      "${config.home.homeDirectory}/.local/share/warp-terminal/themes";
    GH_TOKEN = "$(${pkgs.pass}/bin/pass show github/token)";
  };
}
