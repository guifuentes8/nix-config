{ inputs, outputs, pkgs,   ... }: {

  imports = [ ];
  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  programs.zsh.enable = true;
  system.stateVersion = 5;
  nix = {
    settings = {
      trusted-users = [ "@admin" "administrador" "root" "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };
  users.users.administrador = {
    name = "administrador";
    home = "/Users/administrador";
  };
  nix.extraOptions = ''
    extra-platforms = x86_64-linux x86_64-darwin aarch64-darwin
  '';
  nix.linux-builder = { enable = true; };
}
