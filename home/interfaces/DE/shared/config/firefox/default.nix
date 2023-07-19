{ ... }:
{
  home.file.".mozilla/firefox/guifuentes8/chrome/Colloid" = {
    source = ./chrome/Colloid;
    recursive = true;
  };
  programs.firefox.profiles."guifuentes8" = {
    settings = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
    userChrome = ''
      @import "Colloid/theme.css";
      @import "customChrome.css"; 

    '';
    userContent = ''
      @import "Colloid/colors/light.css";
      @import "Colloid/colors/dark.css";

      @import "Colloid/pages/newtab.css";
      @import "Colloid/pages/privatebrowsing.css";

      @import "Colloid/parts/video-player.css";

    '';
  };

}
