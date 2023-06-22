{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles = {
      "guifuentes8" = {
        bookmarks = { };
        extensions = [ ];
        extraConfig = '''';
        id = 0;
        name = "cli2nix";
        search = {
          default = "Google";
          force = true;
          order = [
            "DuckDuckGo"
            "Google"
          ];
        };
        settings = { };
        userChrome = '''';
        userContent = '''';

      };
    };
  };
}
