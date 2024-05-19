{ pkgs, configOptions, ... }: {
  imports = [

    # HARDWARE ----------------------------------------

    # Hardware config (required)
    ./hardware-configuration.nix

    # Hardware Gpu (if exist)
    ../global/hardware/gpu/amdgpu.nix

    # NIXOS CONFIG ------------------------------------

    # global NixOs Config 
    ../global

    # Boot initial (grub or systemd)
    ../global/boot/systemd-boot.nix
    ../global/hardware/logitech.nix

    # Login Manager
    ../global/login/sddm.nix

    # Choice Interface (WM and/or DE)
    ../global/interfaces/DE/kde.nix

    # Active services
    ../global/services/common
    ../global/services/extra/virt-manager.nix

    # User 
    ../global/users/guifuentes8.nix

  ];

  # SYSTEM CONFIGS --------------------------------------

  # Basic config
  #console.keyMap = "br-abnt2";
  console.keyMap = "us";
  services.xserver = { layout = "${configOptions.styles.keyboard.layout}"; };

  # Network config (nmtui)
  networking.hostName = "pikachu";

  environment = {
    pathsToLink = [ "/libexec" "/etc" ];
    variables = { };
    sessionVariables = {
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      PATH = [ "\${XDG_BIN_HOME}" ];
      TZ = "America/Sao_Paulo";
    };
  };

}
