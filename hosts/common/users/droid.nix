{ config, inputs, lib, outputs, pkgs, ... }: {

  #imports = [ ../../common ];

  #  nix = {
  #    settings = {
  #      trusted-users = [ "droid" "@admin" "root" "@wheel" ];
  #      experimental-features = [ "nix-command" "flakes" ];
  #      warn-dirty = false;
  #    };
  #    #  optimise.automatic = true;
  #  };

  terminal.font = "${
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    }/share/fonts/truetype/JetBrainsMono.ttf";
  time.timeZone = lib.mkDefault "America/Sao_Paulo";
  user.shell = "${pkgs.zsh}/bin/zsh";
  user.username = "gui8";

  #----
}
