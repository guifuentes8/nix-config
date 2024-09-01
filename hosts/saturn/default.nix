{ pkgs, config, lib, ... }: {

  #imports = [../global];
  services.nix-daemon.enable = true;
  nixpkgs.hostPlatform = "x86_64-darwin";
  environment.systemPackages = with pkgs; [ spotify vscode warp-terminal ];
  programs.zsh.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" "vscode" "warp-terminal" ];
  nix.linux-builder.enable = true;
  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };
}
