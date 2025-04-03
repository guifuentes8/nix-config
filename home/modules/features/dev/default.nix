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

    # Programming languages and dependencies packages 
    # pkgs.nodePackages.graphql-language-service-cli
    pkgs.bun
    pkgs.nodejs_22
    pkgs.pnpm
    pkgs.nest-cli
    pkgs.maven
    #pkgs.nodePackages.eas-cli
    #pkgs.nodePackages.expo-cli
  ];
}

