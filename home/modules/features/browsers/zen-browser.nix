{ pkgs, outputs, ... }:
let zen-browser = outputs.packages.${pkgs.system}.zen-browser;
in { home.packages = [ zen-browser ]; }
