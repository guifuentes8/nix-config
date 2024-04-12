{ pkgs, ... }: {
  imports = [ ];

  home.packages = with pkgs; [ nodePackages.eas-cli nodePackages.expo-cli ];
}
