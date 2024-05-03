{ lib, stdenv, fetchFromGitHub, cmake, gperf, file, ncurses, openssl, readline
, sqlite, zlib }:

stdenv.mkDerivation rec {
  pname = "nchat";
  version = "4.41";

  src = fetchFromGitHub {
    owner = "d99kris";
    repo = "nchat";
    rev = "v${version}";
    hash = "sha256-P+QprQDXUv5uCa/6+RXYImWDL0DIG+p8KFiGPwK+q0g=";
  };

  postPatch = ''
    substituteInPlace lib/tgchat/ext/td/CMakeLists.txt \
      --replace "get_git_head_revision" "#get_git_head_revision"
  '';

  nativeBuildInputs = [ cmake gperf ];

  buildInputs = [
    file # for libmagic
    ncurses
    openssl
    readline
    sqlite
    zlib
  ];

  cmakeFlags = [''
    HAS_DUMMY=ON
    HAS_TELEGRAM=ON
    HAS_WHATSAPP=ON'' # go module build required
    ];

  meta = with lib; {
    description =
      "Terminal-based chat client with support for Telegram and WhatsApp";
    mainProgram = "nchat";
    homepage = "https://github.com/d99kris/nchat";
    license = licenses.mit;
    maintainers = with maintainers; [ sikmir ];
    platforms = platforms.unix;
  };
}
