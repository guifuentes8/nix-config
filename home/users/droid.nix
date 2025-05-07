{ lib, pkgs, outputs, ... }:

{

  imports = [
    # 24.11 ../modules/common/programs.nix
    #../modules/common/sops.nix
    ../modules/features/neovim/nixvim-legacy.nix
    ../modules/features/dev
    ../modules/features/cli

  ];
  sops.age.keyFile = lib.mkForce
    "/data/data/com.termux.nix/files/home/.config/sops/age/keys.txt";

  home = {
    username = lib.mkDefault "droid";
    homeDirectory = lib.mkDefault "/home/droid";
    stateVersion = "24.05";
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = { allowUnfree = true; };
  };

  fonts.fontconfig.enable = true;
  systemd.user.startServices = "sd-switch";
  news.display = "silent";

  programs.bash.bashrcExtra = "zsh";

  ## remove when 24.11 -----------------------

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

    home-manager.enable = true;
    ssh.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        #plugins = [ "git" ];
        #theme = "miloshadzic";
      };

      #export GITHUB_TOKEN=$(cat ${config.sops.secrets.github_token.path})
      initExtra = ''
        unset -v SSH_ASKPASS
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        pokeget umbreon
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
