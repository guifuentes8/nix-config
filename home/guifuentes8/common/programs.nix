{ pkgs, unstable, ... }: {
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.age

    # Nix pkgs required
    unstable.nh
    pkgs.nix-output-monitor
    pkgs.nvd
    pkgs.nixpkgs-fmt

    # zsh
    pkgs.pokemonsay
    pkgs.fortune-kind
  ];

  programs = {
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings.git_protocol = "https";
      extensions = [ pkgs.gh-eco ];
    };
    gh-dash.enable = true;
    git = {
      enable = true;
      lfs.enable = true;
      delta.enable = true;
      userName = "Guilherme Fuentes";
      userEmail = "guifuentes8@gmail.com";
      extraConfig = {
        http.postBuffer = "524288000";
        pull.rebase = false;
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
        # Sign all commits using ssh key
        # commit.gpgsign = true;
        #  gpg.format = "ssh";
        #  user.signingkey = "~/.ssh/id_ed25519.pub";
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
    gpg.enable = true;
    home-manager.enable = true;
    ssh.enable = true;
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "miloshadzic";
      };
      initExtraFirst = ''
        unset -v SSH_ASKPASS
        fortune -s | pokemonsay -n -W -t -d $(printf "%03d\n" $(shuf -i 1-493 -n 1))
      '';
      initExtra = "";
      shellAliases = {
        cjpg = "mogrify -format jpg *.png && rm *.png";
        pick = "xcolor | hyprpicker";
        ls = "lsd";
        clock = "tty-clock -c -C 6 -s -S -r -n -D";
        matrix = "cmatrix -b -f -C red";
        climabauru = "girouette -q -c '1h' -L 'pt_BR' -l 'Bauru' -u metric";
        climasp = "girouette -q -c '1h' -L 'pt_BR' -l 'São Paulo' -u metric";
        torrent = "rtorrent";
        gpt = "tgpt";
        feed = "tuifeed";
        mail = "himalaya -a guifuentes8";
        mail2 = "himalaya -a gcf";
        testnet = "speedtest-rs";
        music = "ncmpcpp";
      };
      localVariables = {
        #  GH_TOKEN = "$(${pkgs.pass}/bin/pass show github/token)";
        FLAKE = "/home/guifuentes8/nix-config";
      };
    };
  };

}
