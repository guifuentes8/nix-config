{ ... }: {
  virtualisation.libvirtd = {
    enable = true;
    allowedBridges = [ "virbr0" ];
  };
  programs.virt-manager.enable = true;
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  networking.nat = {
    enable = true;
    internalInterfaces = [ "virbr0" ];
    externalInterface = "enp3s0";
  };

}

