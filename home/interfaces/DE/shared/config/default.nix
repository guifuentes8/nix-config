{ ... }:
{

  programs.firefox = {
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
