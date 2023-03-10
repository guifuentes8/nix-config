{ pkgs, outputs, ... }:
{

  home.packages = with pkgs; [
    nodejs-16_x
    nixpkgs-fmt
    yarn
  ];
}
