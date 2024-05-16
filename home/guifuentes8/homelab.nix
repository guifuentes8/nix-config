{
  imports = [

    # Global config (required)
    ./global
    ./features/dev

    ./features/desktop/gnome.nix
  ];
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
}
