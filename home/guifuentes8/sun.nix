{
  imports = [

    # Global config (required)
    ./global
    ./features/neovim
  ];
  programs.zsh.initExtraFirst = "cat ${./global/extras/pokecenter.txt}";

}

