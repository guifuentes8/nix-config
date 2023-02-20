{ pkgs, ... }:

let
  wf-recorder-master = pkgs.callPackage ../custom/wf-recorder.nix { };
in

{
  environment.systemPackages = (with pkgs; [

    bpytop
    cava
    cmatrix
    dunst
    feh
    gcalcli
    glib
    grim
    himalaya
    mpv
    ncspot
    pavucontrol
    playerctl
    ranger
    slurp
    sptlrx
    sway
    swaylock
    swayidle
    tty-clock
    waybar
    wayland
    wl-clipboard
    wf-recorder-master
    xdg-utils
    xfce.thunar
    xfce.xfconf

  ]);

  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris ];
      };
    })
  ];
}
