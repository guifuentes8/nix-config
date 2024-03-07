# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, outputs,  nix-colors, unstable,... }:

{
  imports = [

  ];

  wsl.enable = true;
  wsl.defaultUser = "guifuentes8";
  wsl.startMenuLaunchers = true;  
  home-manager.extraSpecialArgs = { inherit inputs outputs nix-colors unstable; };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.guifuentes8 = import ../../home/guifuentes8/windows.nix;

environment.systemPackages =  [
    pkgs.bitwarden
    pkgs.chromium
    pkgs.vim
    pkgs.git
    pkgs.gimp
    pkgs.onlyoffice-bin
    pkgs.slack
    pkgs.discord
    pkgs.spotify
    pkgs.telegram-desktop
    pkgs.ytmdesktop
    pkgs.vscode    
];

  programs.chromium = {
    enable = true;
    extensions = [
        "gphhapmejobijbbhgpjhcjognlahblep" # gnomeExtensions
       "fmkadmapgofadopljbjfkapdkoienihi" # reactDevTools
      "lmhkpmbekcpmknklioeibfkpmmfibljd" # reduxDevTools
      "jdkknkkbebbapilgoeccciglkfbmbnfm" # apolloDevTools
      "bcjindcccaagfpapjjmafapmmgkkhgoa" # jsonFormatter
      "aapbdbdomjkkjkaonfhkkikfgjllcleb" # googleTranslate
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "lpofefdiokgmcdnnaigddelnfamkkghi" # googleTasksApp
    ];
  };
environment.sessionVariables.NIXOS_OZONE_WL = "1";
#nixpkgs.config.spotify.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
nix = {
  package = pkgs.nixFlakes;
  extraOptions = ''
    experimental-features = nix-command flakes
  '';
};
 nixpkgs.config.allowUnfree = true;
 nixpkgs.hostPlatform = "x86_64-linux";  
# This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
