{ lib
, stdenv
, fetchFromGitHub
, meson
, ninja
, pkg-config
, scdoc
, wayland-scanner
, wayland
, wayland-protocols
, ffmpeg
, x264
, libpulseaudio
, ocl-icd
, opencl-headers
}:

stdenv.mkDerivation rec {
  pname = "wf-recorder";
  version = "master";

  src = fetchFromGitHub {
    owner = "ammen99";
    repo = pname;
    rev = "460d454b1efd380a3f732f6fd70c7a5e265381f6";
    sha256 = "sha256-FTlAuqjOrtvjVXH3wiLlANdguys+Zzeo/QJgjbIh3LM=";
  };

  nativeBuildInputs = [ meson ninja pkg-config wayland-scanner scdoc ];
  buildInputs = [
    wayland
    wayland-protocols
    ffmpeg
    x264
    libpulseaudio
    ocl-icd
    opencl-headers
  ];

  meta = with lib; {
    description = "Utility program for screen recording of wlroots-based compositors";
    inherit (src.meta) homepage;
    changelog = "https://github.com/ammen99/wf-recorder/tree/master";
    license = licenses.mit;
    maintainers = with maintainers; [ yuka ];
    platforms = platforms.linux;
  };
}
