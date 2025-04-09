{ pkgs, ... }:

{
  imports = [ ./vscode.nix ];

  programs = {
    go.enable = true;
    java.enable = true;
    pyenv.enable = true;
    rbenv.enable = true;
  };

  # Programming languages and dependencies packages
  home.packages = with pkgs; [
    bun
    nodejs_22
    pnpm
    nest-cli
    maven
    nixfmt-rfc-style
  ];
}
