{ pkgs, config, inputs, lib, ... }:

{
  imports = [ ./extras/dependencies.nix ];
  home.packages = [ pkgs.age pkgs.pokeget-rs ];

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
      package = if (pkgs.stdenv.hostPlatform.isDarwin) then
        inputs.nh_plus.packages."aarch64-darwin".nh
      else
        pkgs.nh;
      flake = "${config.home.homeDirectory}/nix-config";
    };
    home-manager.enable = true;
    ssh.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        #plugins = [ "git" ];
        #theme = "miloshadzic";
      };

      initExtra = ''
        unset -v SSH_ASKPASS
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        export GITHUB_TOKEN=$(cat ${config.sops.secrets.github_token.path})
      '';
      shellAliases = {
        cjpg = "mogrify -format jpg *.png && rm *.png";
        pick = "xcolor | hyprpicker";
        clock = "clock-rs";
        #   clock = "tty-clock -c -C 6 -s -S -r -n -D";
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

}
