{ lib, pkgs, fetchFromGitHub, rustPlatform, pkg-config, alsa-tools, alsa-lib }:

rustPlatform.buildRustPackage rec {
  pname = "ytermusic";
  version = "16e3b0f5084981dc57cc2cb4b7b64e6798e9c41f";

  src = fetchFromGitHub {
    owner = "ccgauche";
    repo = pname;
    rev = version;
    hash = "sha256-Bl/hRzs4c+OLOUw8QXg+N6x4umVho9KtponU/QzbtMM=";
  };

  cargoSha256 = "";

  buildInputs = with pkgs; [
    dbus
    alsa-tools
    alsa-lib
  ];
  nativeBuildInputs = [
    pkg-config
  ];

  cargoLock = {
    lockFile = ./Cargo.lock;
    allowBuiltinFetchGit = true;
  };


  meta = with lib; {
    description = "A fast line-oriented regex search tool, similar to ag and ack";
    homepage = "https://github.com/BurntSushi/ripgrep";
    license = licenses.unlicense;
    maintainers = [ ];
  };
}
