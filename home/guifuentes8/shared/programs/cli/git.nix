{
  programs.git =
    {
      enable = true;
      userName = "Guilherme Fuentes";
      userEmail = "guifuentes8@gmail.com";
      aliases = {
        a = "add .";
        co = "checkout";
        cn = "checkout -b ";
        cm = "commit";
        ps = "push";
        pl = "pull";
        fe = "fetch";
        st = "status";
        undo = "reset HEAD~1 --hard";
      };
    };
}
