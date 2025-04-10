{pkgs, ... }: {
  imports = [ ./default.nix ./waybar.nix ];

  home.packages = with pkgs.unstable; [
    grim
    hyprpicker
    nwg-look
    slurp
    swaylock-effects
    swayidle
    swayimg
    wdisplays
    wl-clipboard
    wf-recorder
    wtype
  ];

  programs.rofi.package = pkgs.unstable.rofi-wayland;
  programs.mpv.config.gpu-context = "wayland";
  programs.zsh.sessionVariables = { KITTY_ENABLE_WAYLAND = 1; };

}
