{ pkgs, ... }: {
  imports = [ ];

  programs = {

    # Vcs ----------

    # GIT
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
