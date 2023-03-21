{
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    font = "JetbrainsMono Nerd Font 12";
    borderRadius = 8;
    width = 400;
    extraConfig = ''

      background-color=#24273a
      text-color=#cad3f5
      border-color=#8aadf4
      progress-color=over #363a4f

      [urgency=high]
      border-color=#f5a97f
    '';
  };
}
