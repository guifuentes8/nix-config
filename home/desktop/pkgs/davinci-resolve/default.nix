{ pkgs, ... }:
let
  icon = ./davinci-resolve-icon.png;
in
{
  home.packages = with pkgs; [
    davinci-resolve
  ];
  home.file."davinci-resolve.desktop" = {
    enable = true;
    executable = true;
    text = ''
      [Desktop Entry]
        Name=DaVinci Resolve
        GenericName=DaVinci Resolve
        Exec=davinci-resolve
        Type=Application
        Terminal=false
        Icon=${icon}
        StartupNotify=true
        StartupWMClass=resolve
        MimeType=application/x-resolveproj;
    '';
    target = ".local/share/applications/davinci-resolve.desktop";
  };
}
