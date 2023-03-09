{ stdenv
, lib
, fetchFromGitHub
, rustPlatform
, pkg-config
, SDL2
, rustc
, rustup
, xorg
}:
rustPlatform.buildRustPackage rec {
  pname = "xgifwallpaper";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "calculon102";
    repo = "${pname}";
    rev = "v${version}";
    hash = "sha256-iiYLCed+2QfPZUKbiQGLleDAGYf5EaEgFsrH7S5somQ=";
  };

  cargoHash = "sha256-CuRnhqJHbsabQCoh0Jl79MXf/HZHvSF4ab8Qsny/xRY=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ rustc SDL2 xorg.libXinerama xorg.libxshmfence xorg.libXext ];

  doCheck = false;

  meta = with lib; {
    description = "Use an animated GIF as wallpaper on X11-systems.";
    homepage = "https://github.com/calculon102/${pname}";
    license = licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
  };
}
