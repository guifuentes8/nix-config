{ pkgs, ... }:

{

  programs = {
    go.enable = true;
    go.package = pkgs.unstable.go;
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
