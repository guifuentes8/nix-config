{ pkgs, config, lib, ... }: {

  imports = [../../home/darwin/nixvim.nix];
  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
#  environment.systemPackages = with pkgs; [ spotify vscode warp-terminal ];
  programs.zsh.enable = true;
#  nixpkgs.config.allowUnfreePredicate = pkg:
#    builtins.elem (lib.getName pkg) [ "spotify" "vscode" "warp-terminal" ];
system.stateVersion = 5;
  nix = {
    settings = {
      trusted-users = ["@admin" "administrador"  "root" "@wheel" ];
      experimental-features = [ "nix-command" "flakes"  ];
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
nix.linux-builder = {
    enable = true;
  };
}
