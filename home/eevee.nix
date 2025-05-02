{ config, inputs, pkgs, nixgl, ... }:
let wrapGL = config.lib.nixGL.wrap;
in {
  imports = [

    # Global config (required)
    ./users/gui8.nix

    ./modules/features/cli
    ./modules/features/dev
    ./modules/features/neovim
    ./modules/features/terminals/ghostty.nix

  ];
  targets.genericLinux.enable = true;
  programs = {
    obs-studio.package = wrapGL pkgs.obs-studio;
    ghostty.package = wrapGL pkgs.unstable.ghostty;
    vscode.package = wrapGL pkgs.unstable.vscode;
  };
  home.packages = with pkgs; [
    (wrapGL bitwarden)
    (wrapGL discord)
    (wrapGL gimp)
    (wrapGL unstable.harmony-music)
    (wrapGL onlyoffice-bin)
    (wrapGL pokemmo-installer)
    (wrapGL inputs.zen-browser.packages."${system}".beta)
  ];

  nixGL.packages = nixgl.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.offloadWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];
  programs.zsh.initExtraFirst = "pokeget eevee";
  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';

}
