{ pkgs, outputs, unstable, lib, config, nix-colors, ... }:
let
  waylandArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
  warp-terminal = outputs.packages.${pkgs.system}.warp-terminal;

in {
  imports =
    [ ./global ./features/cli ./features/dev/languages ./features/dev/neovim ];

  nixpkgs.config = { chromium.commandLineArgs = waylandArgs; };
  targets.genericLinux.enable = true;
  xdg.enable = true;
  xdg.mime.enable = true;

  home = {
    packages = [ warp-terminal pkgs.chromium ];
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
