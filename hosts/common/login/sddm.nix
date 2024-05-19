{ outputs, pkgs, ... }: {
  services.xserver = {
    enable = true;
    displayManager = {
      sddm = {
        wayland.enable = true;
        enable = true;
        enableHidpi = false;
        autoNumlock = true;
      };
    };
  };

}
