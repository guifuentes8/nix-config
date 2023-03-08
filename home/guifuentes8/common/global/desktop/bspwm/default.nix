{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../common
    ../../programs/wm
    ../../programs/wm/xorg
  ];
}
