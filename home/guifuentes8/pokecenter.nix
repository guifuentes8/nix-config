{
  imports = [

    # Global config (required)
    ./common
    ./features/neovim
  ];
  programs.zsh.initExtraFirst = "cat ${./extras/pokecenter.txt}";

}

