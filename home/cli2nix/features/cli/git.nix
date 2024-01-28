{ pkgs, ... }: {
  imports = [ ];

  programs = {

    # Vcs ----------

    # GIT
    git = {
      enable = true;
      delta.enable = true;
      userName = "Guilherme Fuentes";
      userEmail = "guifuentes8@gmail.com";
      extraConfig = {
        http.postBuffer = "524288000";
        pull.rebase = false;
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
      };
      aliases = {
        a = "add .";
        co = "checkout";
        cn = "checkout -b ";
        cm = "commit";
        ps = "push";
        pl = "pull";
        fe = "fetch";
        st = "status";
        rs = "reset HEAD~1 --hard";
      };
    };
  };
}
