{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    package = pkgs.vscodium;
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace (import ./extensions.nix).extensions;
    globalSnippets = { };
    userSettings = {
      "files.autoSave" = "off";
      "editor.formatOnSave" = true;

      "workbench.colorTheme" = "Tokyo Night Storm";
      "workbench.iconTheme" = "material-icon-theme";

      "[nix]"."editor.tabSize" = 2;
    };
    keybindings = [
      {
        key = "ctrl+c";
        command = "editor.action.clipboardCopyAction";
        when = "textInputFocus";
        args = {
          direction = "up";
        };
      }
    ];
  };
}