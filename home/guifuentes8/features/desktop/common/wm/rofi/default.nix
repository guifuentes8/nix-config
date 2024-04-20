{ unstable, pkgs, lib, config, configOptions, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = (import ./theme.nix { inherit config lib configOptions; });
    plugins = with unstable; [
      rofi-bluetooth
      rofi-calc
      rofi-emoji
      rofi-power-menu
      rofi-pulse-select
      rofi-systemd
      rofi-rbw
    ];
  };

  home.packages = with unstable; [
    rofi-bluetooth
    rofi-calc
    rofi-emoji
    rofi-power-menu
    rofi-pulse-select
    rofi-systemd
    rofi-rbw
  ];

  programs.rbw = {
    enable = true;
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
      pinentry = pkgs.pinentry-gnome;
    };
  };

}
