{ pkgs, outputs, ... }:
let dbgate = outputs.packages.${pkgs.system}.dbgate;
in {
  imports = [ ./vscode.nix ];

  programs = {
    go.enable = true;
    java.enable = true;
    pyenv.enable = true;
    rbenv.enable = true;
  };

  home.packages = [
    # Extra programs for development
    #dbgate
    pkgs.firefox-devedition-bin
    pkgs.insomnia

    # Programming languages and dependencies packages 
    # pkgs.nodePackages.graphql-language-service-cli
    pkgs.nodejs
    pkgs.yarn
    pkgs.nest-cli
    pkgs.maven
    #pkgs.nodePackages.eas-cli
    #pkgs.nodePackages.expo-cli
  ];
}

