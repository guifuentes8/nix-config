{ config, pkgs, inputs, outputs, configOptions, ... }: {
  imports = [

    # HARDWARE ----------------------------------------

    # Hardware config (required)
    ./hardware-configuration.nix
    ../global/hardware/bluetooth.nix

    # Hardware Gpu (if exist)
    ../global/hardware/gpu/notebook-prime.nix

    # NIXOS CONFIG ------------------------------------

    # global NixOs Config 
    ../global

    # Boot initial (grub or systemd)
    ../global/boot/systemd-boot.nix

    # Login Manager
    ../global/login/greetd.nix

    # Choice Interface (WM and/or DE)
    ../global/interfaces/DE/gnome.nix
    ../global/interfaces/WM/hyprland.nix

    # Active services
    ../global/services/common

    # User 
    ../global/users/guifuentes8.nix

  ];

  # SYSTEM CONFIGS --------------------------------------

  # Basic config
  console.keyMap =
    "${configOptions.styles.keyboard.languageVariant}${configOptions.styles.keyboard.variant}";
  services.xserver = { layout = "${configOptions.styles.keyboard.layout}"; };

  # Network config (nmtui)
  networking.hostName = "avell";

  environment = {
    pathsToLink = [ "/libexec" "/etc" ];
    variables = { };
    sessionVariables = rec {
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      PATH = [ "\${XDG_BIN_HOME}" ];
      TZ = "America/Sao_Paulo";
    };
  };

}
