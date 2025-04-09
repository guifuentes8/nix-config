{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.unstable.ghostty;
    enableZshIntegration = true;
    installVimSyntax = true;
    installBatSyntax = true;
  };
}
