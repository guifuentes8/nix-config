{ outputs, pkgs, lib, config, ... }:
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
    sessionVariables = { };
  };
  programs.zsh.initExtraFirst = "cat ${./extras/squirtle.txt}";

  programs.zsh.shellAliases = {
    adb =
      "/mnt/c/Users/guifuentes8/Local\\ Settings/Android/Sdk/platform-tools/adb";

  };

  programs.zsh.localVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WGPU_BACKEND = "gl";
    BROWSER = "";
    WARP_THEMES_DIR =
      "${config.home.homeDirectory}/.local/share/warp-terminal/themes";
  };
}
