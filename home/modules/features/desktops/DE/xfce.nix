{ pkgs, ... }: {

  imports = [

    ../../browsers/firefox.nix
    ../../browsers/chromium.nix
    ../../browsers/qutebrowser.nix
    ../../terminals/foot.nix
    ../../cli
    ../../programs
    ../../services

  ];

}
