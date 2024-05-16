{ ... }: {
  virtualisation.libvirtd = { enable = true; };
  programs.virt-manager.enable = true;
  boot.extraModprobeConfig = "options kvm_intel nested=1";
}

