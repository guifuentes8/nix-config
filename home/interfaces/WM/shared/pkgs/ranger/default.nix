{ pkgs, ... }:
{
  home.packages = with pkgs;[
    ranger

    /* Code highlight */
    highlight

    /* archive view */
    atool
    file
    librsvg
    p7zip

    /* ASCII-art image previews */
    libcaca

    /* Web and image preview */
    lynx

    /* Pdf viewer and open */
    poppler_utils
    llpp

    /* Ebook viewer */
    gnome-epub-thumbnailer
  ];

  xdg.configFile."ranger/rc.conf".source = ./rc.conf;
  xdg.configFile."ranger/rifle.conf".source = ./rifle.conf;
  xdg.configFile."ranger/scope.sh".source = ./scope.sh;
}
