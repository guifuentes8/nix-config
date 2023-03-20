{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../shared
    ../../programs/wm/shared
    ../../programs/wm/wayland
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    extraConfig =
      (import ./config.nix {
        inherit (config);
      });
  };
}
