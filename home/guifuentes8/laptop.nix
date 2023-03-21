{ config, outputs, ... }:
{
  imports = [
    ./shared
    ./shared/manager/window/wayland/interface/hyprland
  ];
}
