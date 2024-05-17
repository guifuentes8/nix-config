{ ... }: {
  virtualisation.libvirtd = {
    enable = true;
    allowedBridges = [ "virbr0" ];
  };
  programs.virt-manager.enable = true;
  boot.extraModprobeConfig = "options kvm_intel nested=1";
  fileSystems."/run/media/guifuentes8/homelabStorage" = {
    device = "/dev/sda1";
    fsType = "btrfs";
  };
  networking.nat = {
    enable = true;
    internalInterfaces = [ "virbr0" ];
    externalInterface = "enp3s0";
  };

}

