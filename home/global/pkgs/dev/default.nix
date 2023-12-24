{ pkgs, ... }:
{
  imports = [
    ./neovim
    ./zsh
  ];

  programs = {

    # Vcs ----------

    # GIT
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings.git_protocol = "ssh";
    };
    git = {
      enable = true;
      delta.enable = true;
      userName = "Guilherme Fuentes";
      userEmail = "guifuentes8@gmail.com";
      extraConfig = {
        http.postBuffer = "524288000";
        pull.rebase = false;
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

    # Languages ------------

    # GO
    go.enable = false;

    # JAVA
    java.enable = false;

    # PYTHON
    pyenv.enable = false;

    # RUBY
    rbenv.enable = false;

    # Ide ---------------

    vscode = {
      enable = true;
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = true;
      package = pkgs.vscode;
      keybindings = [ ];
    };

  };

  home.packages = with pkgs; [

    # Development programs --------------
    insomnia

    # Languages ------------------

    # JAVASCRIPT
    nodejs
    yarn

    # JAVA
    maven

    # NIX
    nixpkgs-fmt

    # DATABASES -------------
    sqlite
  ];
}
