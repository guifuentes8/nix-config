{ pkgs, outputs, unstable, ... }:
let
  dbgate = outputs.packages.${pkgs.system}.dbgate;
  warpp = outputs.packages.${pkgs.system}.warp-terminal;
  warp-term = unstable.warp-terminal.overrideAttrs (finalAttrs: previousAttrs: {
    version = "0.2024.03.05.08.02.stable_01";
    src = pkgs.fetchurl {
      url =
        "https://releases.warp.dev/stable/v${finalAttrs.version}/warp-terminal-v${finalAttrs.version}-1-x86_64.pkg.tar.zst";
      sha256 = "SZ4CR8KjGYIysuARGDmHcpFWavebqAIBhalWeRqh9C8=";

    };
  });
in {
  imports = [ ./neovim ./languages ./firefox-dev.nix ./vscode.nix ];

  home.packages = [
    dbgate
    pkgs.insomnia
    #unstable.warp-terminal
    # warp-term
    warpp
  ];

}

