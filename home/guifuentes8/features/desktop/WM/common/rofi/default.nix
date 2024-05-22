{ pkgs, lib, config, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "footclient";
    #theme = (import ./theme.nix { inherit config lib; });
    plugins = with pkgs; [
      rofi-bluetooth
      rofi-calc
      rofi-emoji
      rofi-power-menu
      rofi-pulse-select
      rofi-systemd
      # rofi-rbw
    ];
  };

  home.packages = with pkgs; [
    rofi-bluetooth
    rofi-calc
    rofi-emoji
    rofi-power-menu
    rofi-pulse-select
    rofi-systemd
    #rofi-rbw
  ];

  programs.rbw = {
    enable = false;
    package = pkgs.rbw.overrideAttrs (oldAttrs: {
      patches = oldAttrs.patches ++ [
        (pkgs.fetchpatch {
          name = "add-useragent.patch";
          url = "https://github.com/doy/rbw/files/14921243/patch.txt";
          sha256 = "sha256-SS+PTWA1UTsluts9Qtv+q3LJ22PTRUZ+usOB0aqz3Rk=";
        })
      ];
    });
    settings = {
      email = "guifuentes8@gmail.com";
      pinentry = pkgs.pinentry-gnome3;
    };
  };

}
