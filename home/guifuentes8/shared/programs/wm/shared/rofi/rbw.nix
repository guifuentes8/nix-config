{ pkgs, ... }:
{

  home.packages = with pkgs; [
    rofi-rbw
    pinentry-gnome

  ];

  xdg.configFile."rofi-rbw.rc" = {
    source = ./rofi-rbw.rc;
  };

  programs.rbw = {
    enable = true;
    package = pkgs.rbw;
    settings = {
      email = "guifuentes8@gmail.com";
      pinentry = "gnome3";
      action = "type";
      target = "username";
      prompt = "Search: ";
      selector = "rofi";
      selector-args = " -theme-str 'window {width: 50%; height: = '400px;'}' ";
      clipboarder = "xclip";
      typer = "xdotool";
    };
  };

}


