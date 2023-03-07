{
  services.xserver = {
    layout = "br";
    xkbVariant = "abnt2";
    enable = true;
    libinput.enable = true;
    excludePackages = [ pkgs.xterm ];
  };
}
