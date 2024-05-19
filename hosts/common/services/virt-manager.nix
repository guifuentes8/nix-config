{ ... }: {
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    allowedBridges = [ "virbr0" ];
  };
  networking = {
    nat = {
      enable = true;
      internalInterfaces = [ "virbr0" ];
      externalInterface = "enp3s0";
    };
    firewall.trustedInterfaces = [ "virbr0" ];
  };
  boot.extraModprobeConfig = "options kvm_intel nested=1";
}

