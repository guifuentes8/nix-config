{ ... }:
{
  imports = [

    # Global config (required)
    ./global

    # Environment (DE and/or WM)
    ./interfaces/WM/shared

    # Wayland or Xorg (if WM is selected)
    ./interfaces/WM/xorg

  ];
}
