{ pkgs, ... }: {
  imports = [ ];

  programs = {
    # Languages ------------

    # GO
    go.enable = true;

    # JAVA
    java.enable = true;

    # PYTHON
    pyenv.enable = true;

    # RUBY
    rbenv.enable = true;

    # Ide ---------------
  };

  home.packages = with pkgs; [

    # Development programs --------------
    insomnia

    # Languages ------------------

    # GRAPHQL

    # JAVASCRIPT
    nodejs
    yarn

    # JAVA
    maven

    # DATABASES -------------
  ];
}
