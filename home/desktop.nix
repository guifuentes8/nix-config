{ ... }:
{
  imports = [

    # Global config (required)
    ./global

    # Environment (DE)
    ./interfaces/DE/shared/pkgs
    ./interfaces/DE/gnome

    # Environment (WM)
    #./interfaces/WM/shared


    # Wayland or Xorg (if WM is selected)
    # ./interfaces/WM/xorg

  ];
}
