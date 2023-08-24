{ ... }:
let
  icon = ./davinci-resolve-icon.png;
in
{
  home.file."davinci-resolve.desktop" = {
    enable = true;
    executable = true;
    text = ''
      [Desktop Entry]
        Name=DaVinci Resolve
        GenericName=DaVinci Resolve
        Exec=env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia davinci-resolve %u
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
