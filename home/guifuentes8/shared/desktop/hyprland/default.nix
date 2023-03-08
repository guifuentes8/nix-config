{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../shared
    ../../programs/wm
    ../../programs/wm/wayland
    inputs.hyprland.homeManagerModules.default
  ];
  /*  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
  }); */

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    extraConfig =
      (import ./config.nix {
        inherit (config);
      });
  };
}
