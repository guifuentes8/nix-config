{ pkgs, config, inputs, lib, ... }:

{
  imports = [ ./extras/dependencies.nix ];
  home.packages = [ pkgs.age ]
    ++ lib.optional pkgs.stdenv.isLinux pkgs.seafile-client;

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
      };
      aliases = {
        a = "add .";
        ch = "checkout";
        new = "checkout -b";
        cm = "commit -m";
        ps = "push";
        pl = "pull";
        fe = "fetch";
        st = "status";
        rs = "reset HEAD~1 --hard";
      };
    };
    gpg.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
      flake = "${config.home.homeDirectory}/nix-config";
    };
    home-manager.enable = true;
    ssh.enable = true;
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      # plugins = [{
      #   name = "powerlevel10k";
      #   src = pkgs.zsh-powerlevel10k;
      #   file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      # }];
      # oh-my-zsh = {
      #   enable = true;
      #   #plugins = [ "git" ];
      #   #theme = "miloshadzic";
      # };
      initContent = ''
        unset -v SSH_ASKPASS
        export GITHUB_TOKEN=$(cat ${config.sops.secrets.github_token.path}) 
      '';
      shellAliases = {
        cjpg = "mogrify -format jpg *.png && rm *.png";
        pick = "xcolor | hyprpicker";
        clock = "clock-rs";
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
    };
  };

  home.file.".p10k.zsh" = { source = ./extras/.p10k.zsh; };
}
