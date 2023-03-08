{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../shared
    ../../programs/wm
    ../../programs/wm/xorg
  ];
}
