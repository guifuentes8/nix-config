{ ... }:
{
  imports = [
    # Global config (required)
    ./global

    # Environment (DE and/or WM)
    ./interfaces/WM/shared

    # Wayland or Xorg Packages
    ./interfaces/WM/wayland

  ];
}
