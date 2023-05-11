{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, cmake
, alsa-lib
, dbus
, fontconfig
}:

rustPlatform.buildRustPackage rec {
  pname = "spotify-player";
  version = "f49b58827e3a9b474b6759903e16b095e4d5353a";

  src = fetchFromGitHub {
    owner = "aome510";
    repo = pname;
    rev = "f49b58827e3a9b474b6759903e16b095e4d5353a";
    sha256 = "sha256-l7R7l3lMbjlJXNtT4qDJqmsGB3da6JxDExBTrTx2Ses=";
  };

  cargoHash = "sha256-R5rRHe7CZs0Mrp5l8SRsFrwJzpOgAa8XV2yED2Iiju4=";

  nativeBuildInputs = [
    pkg-config
    cmake
  ];

  buildInputs = [
    openssl
    alsa-lib
    dbus
    fontconfig

  ];

  buildNoDefaultFeatures = true;

  buildFeatures = [
    "rodio-backend"
    "media-control"
    "notify"
    "image"
    "sixel"
  ];

  meta = with lib; {
    description = "A command driven spotify player";
    homepage = "https://github.com/aome510/spotify-player";
    mainProgram = "spotify_player";
    license = licenses.mit;
    maintainers = with maintainers; [ dit7ya ];
  };
}
