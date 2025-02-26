{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    package = pkgs.vscode;
    keybindings = [ ];
  };

  home.packages = [pkgs.nixpkgs-fmt];
}
