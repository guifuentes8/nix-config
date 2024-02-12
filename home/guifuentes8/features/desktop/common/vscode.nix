{ pkgs, ... }: {
  imports = [ ];

  programs = {
    vscode = {
      enable = true;
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = true;
      package = pkgs.vscode;
      keybindings = [ ];
    };

  };
}
