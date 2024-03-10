{ lib, fetchurl, appimageTools }:

let
  pname = "dev.warp.Warp.desktop";
  version = "23.06.14";
  src = fetchurl {
    url = "https://app.warp.dev/download?package=appimage";
    sha256 = "sha256-Ku8Wx5sA/98w/3bQPhcxfwAh52mSzc9mufusQo0Cv0E=";
  };
  appimageContents = appimageTools.extractType2 { inherit pname src version; };

in appimageTools.wrapType2 {
  inherit pname src version;

  extraPkgs = pkgs: with pkgs; [ ffmpeg ];

  extraInstallCommands = ''
    mv $out/bin/${pname}-${version} $out/bin/warp-terminal
    install -m 444 -D ${appimageContents}/${pname} -t $out/share/applications
    substituteInPlace $out/share/applications/${pname} --replace 'Exec=AppRun --no-sandbox' 'Exec=${pname}'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = with lib; {
    description = "A fully open source & end-to-end encrypted note taking app.";
    homepage = "https://shotcut.com";
    license = licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
  };
}

