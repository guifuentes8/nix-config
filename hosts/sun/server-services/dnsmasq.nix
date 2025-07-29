{ ... }: {
  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true;
    settings = {
      domain-needed = true;
      bogus-priv = true;
      listen-address = [ "127.0.0.1" "100.101.186.113" ];
      server = [ "100.100.100.100" "1.1.1.1" "8.8.8.8" ];
      address = [ "/photos.sun.mau-becrux.ts.net/100.101.186.113" ];
    };
  };
  networking.nameservers = [ "127.0.0.1" "1.1.1.1" "8.8.8.8" ];
}
