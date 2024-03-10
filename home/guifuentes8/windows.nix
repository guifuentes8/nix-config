{ pkgs, unstable, lib, config, nix-colors, ... }:
let waylandArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
in {
  imports = [ ./global ./features/cli ./features/dev ];

  nixpkgs.config = { chromium.commandLineArgs = waylandArgs; };
  targets.genericLinux.enable = true;
  xdg.enable = true;
  xdg.mime.enable = true;

  home = {
    packages = [
      # unstable.warp-terminal
      pkgs.chromium
    ];
    sessionVariables = {
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      WGPU_BACKEND = "gl";
      BROWSER = "chromium";
    };
  };

  programs.zsh.localVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WGPU_BACKEND = "gl";
    BROWSER = "chromium";
  };
}
