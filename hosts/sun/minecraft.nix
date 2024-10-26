{ ... }: {
  services.minecraft-server = {
    enable = false;
    openFirewall = true;
    dataDir = "/mnt/storage/minecraft";
    eula = true;
    declarative = true;
    #   whitelist = { username1 = "guifuentes8"; };
    serverProperties = {
      server-port = 9999;
      enable-rcon = true;
      difficulty = 3;
      gamemode = 1;
      max-players = 3;
      motd = "NixOS-guifuentes8 Minecraft server!";
      white-list = true;
      "rcon.password" = "guigui";
    };
  };
}
