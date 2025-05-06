{ pkgs, ... }: {
  programs.ghostty = {
    enable = false;
    enableZshIntegration = true;
    #   installVimSyntax = true;
    installBatSyntax = true;
  };
}
