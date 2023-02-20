{ lib, stdenv, fetchzip, }:

stdenv.mkDerivation rec {
  pname = "tokyo-night";
  version = "1.0.0";

  src = fetchzip {
    url = "https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme/archive/refs/heads/master.zip";
    sha256 = "sha256-90V55pRfgiaP1huhD+3456ziJ2EU24iNQHt5Ro+g+M0=";
  };

  installPhase = ''
    mkdir -p $out/share/themes/
    cp -r themes/* $out/share/themes/
  '';


  meta = with lib; {
    homepage = "https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme";
    description = "Fast, reliable, and secure dependency management for javascript";
    maintainers = with maintainers; [
      Fausto-Korpsvart
    ];
  };
}
