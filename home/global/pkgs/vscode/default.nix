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
      "editor.fontFamily" = "JetBrainsMonoNL Nerd Font";

      "explorer.confirmDragAndDrop" = false;
      "explorer.confirmDelete" = false;

      "workbench.colorTheme" = "Tokyo Night";
      "workbench.iconTheme" = "material-icon-theme";

      "[nix]"."editor.tabSize" = 2;
      "[html]"."editor.defaultFormatter" = "vscode.html-language-features";
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
