{ lib, fetchurl, appimageTools }:

let
  pname = "Moosync";
  version = "9.0.0";
  src = fetchurl {
    url = "https://github.com/Moosync/Moosync/releases/download/v9.0.0/Moosync-9.0.0-linux-x86_64.AppImage";
    sha256 = "sha256-NPGSJvxG8QVnk4wp7VDKQVBbIbDV8q0rV4XNVl1PQsI=";
  };
  appimageContents = appimageTools.extractType2 { inherit pname src version; };
in

appimageTools.wrapType2 {
  inherit pname src version;

  extraPkgs = pkgs: with pkgs; [
    ffmpeg
  ];

  extraInstallCommands = ''
    mv $out/bin/${pname}-${version} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/moosync.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/moosync.desktop --replace 'Exec=AppRun --no-sandbox' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = with lib; {
    description = "A fully open source & end-to-end encrypted note taking app.";
    homepage = "https://Moosync.com";
    license = licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
  };
}

