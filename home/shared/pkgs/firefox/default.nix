{ pkgs, inputs, lib, ... }:
{
  home.sessionVariables = {
    TZ = "America/Sao_Paulo";
  };

  programs.firefox = {
    enable = true;
    profiles = {
      "guifuentes8" = {
        bookmarks = import ./bookmarks.nix;
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
        settings = {
          "privacy.resistFingerprinting" = false;
        };
        userChrome = lib.mkDefault '''';
        userContent = lib.mkDefault '''';
      };
    };
  };
}
